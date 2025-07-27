import 'package:flutter/material.dart';
import 'package:student_performance_predictor/models/prediction_input.dart';
import 'package:student_performance_predictor/services/api_service.dart';

class PredictionProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  PredictionInput _input = PredictionInput(
    hoursStudied: 0,
    attendance: 0,
    previousScores: 0,
    sleepHours: 0,
    tutoringSessions: 0,
    physicalActivity: 0,
    parentalInvolvement: 'Medium',
    accessToResources: 'Medium',
    motivationLevel: 'Medium',
    extracurricularActivities: 'Yes',
    internetAccess: 'Yes',
    familyIncome: 'Medium',
    teacherQuality: 'Medium',
    schoolType: 'Public',
    peerInfluence: 'Positive',
    learningDisabilities: 'No',
    parentalEducationLevel: 'College',
    studyEfficiency: 0,
    sleepStudyRatio: 0,
  );

  double? _predictedScore;
  bool _isLoading = false;
  String? _error;

  PredictionInput get input => _input;
  double? get predictedScore => _predictedScore;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void updateInput(PredictionInput newInput) {
    _input = newInput;
    notifyListeners();
  }

  Future<void> predict() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _predictedScore = await _apiService.predictPerformance(_input);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    _predictedScore = null;
    _error = null;
    notifyListeners();
  }
}