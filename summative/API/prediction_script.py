from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
import joblib
import pandas as pd
from pathlib import Path
import os
from typing import Literal

app = FastAPI(
    title="Student Performance Prediction API",
    description="API for predicting student exam scores based on various factors",
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

# Define input data model
class StudentInput(BaseModel):
    Hours_Studied: float = Field(..., ge=0, le=50)
    Attendance: float = Field(..., ge=0, le=100)
    Previous_Scores: float = Field(..., ge=0, le=100)
    Sleep_Hours: float = Field(..., ge=0, le=24)
    Tutoring_Sessions: int = Field(..., ge=0)
    Physical_Activity: int = Field(..., ge=0)
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
        model = joblib.load(model_path)
        print(f"Model loaded successfully from {model_path}")
    else:
        print(f"Model file not found at {model_path}")
        
    if not features_path.exists():
        print(f"Features file not found at {features_path}")
except Exception as e:
    print(f"Error loading model: {e}")

@app.post("/predict")
def predict(student_data: StudentInput):
    if model is None:
        raise HTTPException(status_code=500, detail="Model not loaded. Please check if the model file exists.")
    
    try:
        # Convert to dict and then DataFrame
        input_dict = student_data.dict()
        input_df = pd.DataFrame([input_dict])
        
        # Make prediction
        prediction = model.predict(input_df)[0]
        
        return {
            "predicted_score": round(float(prediction), 2),
            "status": "success"
        }
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@app.get("/")
def read_root():
    return {"message": "Student Performance Prediction API - navigate to /docs for interactive documentation"}

@app.get("/health")
def health_check():
    return {
        "status": "healthy" if model is not None else "unhealthy",
        "model_loaded": model is not None
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)