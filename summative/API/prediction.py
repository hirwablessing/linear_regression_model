from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import joblib
import pandas as pd
from pathlib import Path
import os
from typing import Literal

app = FastAPI(
    title="Student Performance Prediction API",
    description="API for predicting student exam scores",
    version="1.0.0"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Define input model
class StudentInput(BaseModel):
    Hours_Studied: float
    Attendance: float
    Previous_Scores: float
    Sleep_Hours: float
    Tutoring_Sessions: int
    Physical_Activity: int
    Parental_Involvement: Literal["Low", "Medium", "High"]
    Access_to_Resources: Literal["Low", "Medium", "High"]
    Motivation_Level: Literal["Low", "Medium", "High"]
    Extracurricular_Activities: Literal["Yes", "No"]
    Internet_Access: Literal["Yes", "No"]
    Family_Income: Literal["Low", "Medium", "High"]
    Teacher_Quality: Literal["Low", "Medium", "High"]
    School_Type: Literal["Public", "Private"]
    Peer_Influence: Literal["Positive", "Neutral", "Negative"]
    Learning_Disabilities: Literal["Yes", "No"]
    Parental_Education_Level: Literal["High School", "College", "Postgraduate"]
    Study_Efficiency: float
    Sleep_Study_Ratio: float

# Load model at startup
model = None
model_path = Path(__file__).parent.parent / "linear_regression" / "models" / "best_student_performance_model.pkl"
features_path = Path(__file__).parent.parent / "linear_regression" / "models" / "model_features.pkl"

try:
    if model_path.exists():
        # Load the entire pipeline including preprocessor and model
        model = joblib.load(model_path)
        
        # Verify the pipeline is fitted
        if hasattr(model, 'steps') and len(model.steps) > 0:
            print(f"Model loaded successfully from {model_path}")
            print(f"Pipeline steps: {[step[0] for step in model.steps]}")
        else:
            raise ValueError("Loaded model is not a valid scikit-learn Pipeline")
    else:
        raise FileNotFoundError(f"Model file not found at {model_path}")
except Exception as e:
    print(f"Error loading model: {str(e)}")
    model = None

@app.post("/predict")
async def predict(student_data: StudentInput):
    if model is None:
        raise HTTPException(
            status_code=500,
            detail="Model not loaded properly. Please check server logs."
        )
    
    try:
        # Convert input to DataFrame
        input_dict = student_data.dict()
        input_df = pd.DataFrame([input_dict])
        
        # Make prediction
        prediction = model.predict(input_df)[0]
        
        return {
            "predicted_score": round(float(prediction), 2),
            "status": "success"
        }
    except Exception as e:
        raise HTTPException(
            status_code=400,
            detail=f"Prediction failed: {str(e)}"
        )

@app.get("/")
async def root():
    return {"message": "Student Performance Prediction API"}

@app.get("/health")
async def health_check():
    return {
        "status": "ready" if model is not None else "not ready",
        "model_loaded": model is not None
    }