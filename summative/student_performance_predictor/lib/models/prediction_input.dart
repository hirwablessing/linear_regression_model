class PredictionInput {
  double hoursStudied;
  double attendance;
  double previousScores;
  double sleepHours;
  int tutoringSessions;
  int physicalActivity;
  String parentalInvolvement;
  String accessToResources;
  String motivationLevel;
  String extracurricularActivities;
  String internetAccess;
  String familyIncome;
  String teacherQuality;
  String schoolType;
  String peerInfluence;
  String learningDisabilities;
  String parentalEducationLevel;
  double studyEfficiency;
  double sleepStudyRatio;

  PredictionInput({
    required this.hoursStudied,
    required this.attendance,
    required this.previousScores,
    required this.sleepHours,
    required this.tutoringSessions,
    required this.physicalActivity,
    required this.parentalInvolvement,
    required this.accessToResources,
    required this.motivationLevel,
    required this.extracurricularActivities,
    required this.internetAccess,
    required this.familyIncome,
    required this.teacherQuality,
    required this.schoolType,
    required this.peerInfluence,
    required this.learningDisabilities,
    required this.parentalEducationLevel,
    required this.studyEfficiency,
    required this.sleepStudyRatio,
  });

  // Add this copyWith method
  PredictionInput copyWith({
    double? hoursStudied,
    double? attendance,
    double? previousScores,
    double? sleepHours,
    int? tutoringSessions,
    int? physicalActivity,
    String? parentalInvolvement,
    String? accessToResources,
    String? motivationLevel,
    String? extracurricularActivities,
    String? internetAccess,
    String? familyIncome,
    String? teacherQuality,
    String? schoolType,
    String? peerInfluence,
    String? learningDisabilities,
    String? parentalEducationLevel,
    double? studyEfficiency,
    double? sleepStudyRatio,
  }) {
    return PredictionInput(
      hoursStudied: hoursStudied ?? this.hoursStudied,
      attendance: attendance ?? this.attendance,
      previousScores: previousScores ?? this.previousScores,
      sleepHours: sleepHours ?? this.sleepHours,
      tutoringSessions: tutoringSessions ?? this.tutoringSessions,
      physicalActivity: physicalActivity ?? this.physicalActivity,
      parentalInvolvement: parentalInvolvement ?? this.parentalInvolvement,
      accessToResources: accessToResources ?? this.accessToResources,
      motivationLevel: motivationLevel ?? this.motivationLevel,
      extracurricularActivities: extracurricularActivities ?? this.extracurricularActivities,
      internetAccess: internetAccess ?? this.internetAccess,
      familyIncome: familyIncome ?? this.familyIncome,
      teacherQuality: teacherQuality ?? this.teacherQuality,
      schoolType: schoolType ?? this.schoolType,
      peerInfluence: peerInfluence ?? this.peerInfluence,
      learningDisabilities: learningDisabilities ?? this.learningDisabilities,
      parentalEducationLevel: parentalEducationLevel ?? this.parentalEducationLevel,
      studyEfficiency: studyEfficiency ?? this.studyEfficiency,
      sleepStudyRatio: sleepStudyRatio ?? this.sleepStudyRatio,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Hours_Studied': hoursStudied,
      'Attendance': attendance,
      'Previous_Scores': previousScores,
      'Sleep_Hours': sleepHours,
      'Tutoring_Sessions': tutoringSessions,
      'Physical_Activity': physicalActivity,
      'Parental_Involvement': parentalInvolvement,
      'Access_to_Resources': accessToResources,
      'Motivation_Level': motivationLevel,
      'Extracurricular_Activities': extracurricularActivities,
      'Internet_Access': internetAccess,
      'Family_Income': familyIncome,
      'Teacher_Quality': teacherQuality,
      'School_Type': schoolType,
      'Peer_Influence': peerInfluence,
      'Learning_Disabilities': learningDisabilities,
      'Parental_Education_Level': parentalEducationLevel,
      'Study_Efficiency': studyEfficiency,
      'Sleep_Study_Ratio': sleepStudyRatio,
    };
  }
}