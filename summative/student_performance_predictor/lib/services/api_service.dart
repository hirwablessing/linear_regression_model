import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_performance_predictor/models/prediction_input.dart';

class ApiService {
  static const String baseUrl = 'https://linear-regression-model-tqdc.onrender.com';
  Future<double> predictPerformance(PredictionInput input) async {
    final url = Uri.parse('$baseUrl/predict');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(input.toJson());

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['predicted_score'].toDouble();
      } else {
        throw Exception('Failed to get prediction: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }
}