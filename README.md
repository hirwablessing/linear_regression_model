# Academic Performance Forecasting Platform

## Demo Walkthrough
Video demonstration: https://www.youtube.com/watch?v=oUziXqiYgT0

## Resources
Dataset: https://www.kaggle.com/datasets/lainguyn123/student-performance-factors

## 📋 **Project Description**
An intelligent academic forecasting platform that leverages machine learning algorithms to predict student outcomes based on behavioral and academic indicators. This full-stack solution integrates predictive analytics, mobile technology, and cloud APIs to deliver actionable insights for educational stakeholders.

## 🎯 **My ALU Mission**
As an aspiring software engineer, I will dedicate myself to learning and mastering the tools and techniques that can drive change and innovation. I plan to engage in projects that empower individuals and communities by providing them with accessible and user-friendly technological solutions. Through consistent collaboration and networking, I aspire to collaborate with like-minded individuals and organizations, amplifying our collective efforts towards a prosperous and self-sufficient Africa.


## 🔧 **Technical Infrastructure**

### **Core Components:**
1. **Predictive Analytics Engine** - Linear regression model analyzing academic patterns
2. **Cloud API Service** - FastAPI-powered backend with automated documentation
3. **Cross-Platform Mobile Client** - Flutter-based application with responsive design
4. **Data Processing Pipeline** - Automated feature extraction and transformation

## 🤖 **Predictive Analytics Framework**

### **Algorithm Implementation:** Random Forest Linear Regression
- **Output Metric:** Academic Performance Index (0-100 range)
- **Methodology:** Supervised learning with standardized features

### **Model Input Variables:**
1. **Study Duration** - Time invested in academic activities
2. **Academic History** - Past performance metrics (0-100 scale)
3. **Activity Participation** - Engagement in non-academic pursuits (Binary: 1/0)
4. **Rest Patterns** - Nightly sleep duration hours
5. **Practice Assessments** - Quantity of completed mock examinations

### **Performance Metrics:**
- Strong correlation coefficient demonstrating model reliability
- Minimal prediction error ensuring accurate forecasts
- Standardized input preprocessing for consistent results
- Serialized model storage using `.joblib` format for deployment

## 💻 **Development Framework**

### **Server-Side Architecture:**
- **FastAPI Framework** - High-performance web API development
- **Pydantic Models** - Request/response validation and type safety
- **Scikit-learn Library** - Machine learning implementation and preprocessing
- **Joblib Package** - Model serialization and deserialization
- **Uvicorn Server** - ASGI application server for production hosting

### **Client-Side Development:**
- **Flutter SDK** - Multi-platform mobile application framework
- **Dart Language** - Application programming language
- **HTTP Client** - RESTful API integration
- **Material Design Components** - Contemporary user interface elements

### **Analytics Tools:**
- **Pandas Framework** - Data processing and transformation
- **NumPy Library** - Mathematical operations and array handling
- **Visualization Libraries** - Matplotlib and Seaborn for data insights
- **Jupyter Environment** - Interactive development and analysis

## 📲 **Mobile Application Capabilities**

### **User Experience Design:**
- Contemporary gradient aesthetics with Material Design principles
- Form-based input system with real-time validation
- Performance-based color coding for results interpretation

### **Application Logic:**
- Comprehensive input validation across all data fields
- HTTP communication with comprehensive error management
- Live performance prediction with immediate visual response
- Historical prediction storage and retrieval
- One-touch reset functionality for subsequent analyses

### **Result Classification System:**
- 🟢 **Outstanding Performance** (80%+) - Top-tier academic achievement
- 🟠 **Satisfactory Performance** (60-79%) - Standard academic progress
- 🔴 **Improvement Required** (<60%) - Students needing additional support

## 🌐 **API Service Configuration**

### **Production Endpoint:** https://linear-regression-model-tqdc.onrender.com/docs#/default/predict_predict_post

### **Available Routes:**
- **GET /** - Service health check and welcome response
- **POST /predict** - Academic performance prediction service

### **Input Schema:**
```json
{
  "Hours_Studied": 40,
  "Attendance": 3,
  "Previous_Scores": 36,
  "Sleep_Hours": 0,
  "Tutoring_Sessions": 0,
  "Physical_Activity": 2,
  "Parental_Involvement": "Low",
  "Access_to_Resources": "Low",
  "Motivation_Level": "Low",
  "Extracurricular_Activities": "Yes",
  "Internet_Access": "Yes",
  "Family_Income": "Low",
  "Teacher_Quality": "Low",
  "School_Type": "Public",
  "Peer_Influence": "Positive",
  "Learning_Disabilities": "Yes",
  "Parental_Education_Level": "High School",
  "Study_Efficiency": 2,
  "Sleep_Study_Ratio": 3
}
```

### **Output Schema:**
```json
{
  "prediction": 78.5
  "status": "success"
}
```

### **Service Features:**
- Interactive API documentation via Swagger interface
- Comprehensive request validation and error responses
- Cross-origin resource sharing (CORS) enabled
- RESTful architecture following industry standards
- Cloud-hosted with enterprise-grade reliability

## 🎓 **Application Scenarios**

### **Student Benefits:**
- Gain insights into how lifestyle choices affect academic outcomes
- Discover specific areas requiring focused improvement
- Make informed decisions about study time distribution
- Monitor academic trajectory over multiple periods

### **Educator Applications:**
- Proactively identify students requiring intervention
- Adjust instructional approaches based on predictive insights
- Analyze classroom performance patterns and trends
- Deliver targeted support recommendations

### **Parent Engagement:**
- Track children's study habits and wellness indicators
- Recognize connections between daily routines and school success
- Make informed choices about activity participation
- Monitor academic development indicators


## 🔍 **Research Findings**

### **Analytical Discoveries:**
- Study time and historical performance emerge as primary success predictors
- Sleep quality demonstrates significant correlation with academic achievement
- Extracurricular involvement reveals complex relationships with performance
- Practice examination frequency enhances prediction model accuracy

### **Implementation Successes:**
- Achieved successful production deployment of ML model
- Developed user-friendly mobile interface for complex predictive analytics
- Established reliable API infrastructure with comprehensive error handling
- Delivered high-accuracy predictions with transparent, interpretable results

##  **Potential Improvements**

### **Model Enhancement Opportunities:**
- Integrate demographic and socioeconomic variables
- Implement ensemble learning techniques for improved accuracy
- Develop temporal analysis for performance trend identification
- Create individualized recommendation algorithms
