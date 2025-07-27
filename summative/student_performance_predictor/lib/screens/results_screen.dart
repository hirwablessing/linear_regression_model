import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_performance_predictor/providers/prediction_provider.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PredictionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Predicted Exam Score',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      provider.predictedScore?.toStringAsFixed(2) ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'out of 100',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                provider.reset();
                Navigator.pop(context);
              },
              child: const Text('Make Another Prediction'),
            ),
          ],
        ),
      ),
    );
  }
}