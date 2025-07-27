import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_performance_predictor/providers/prediction_provider.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  Color _getScoreColor(double? score) {
    if (score == null) return const Color(0xFF667eea);
    if (score >= 80) return const Color(0xFF48bb78); // Green for excellent
    if (score >= 60) return const Color(0xFFed8936); // Orange for good
    return const Color(0xFFf56565); // Red for needs improvement
  }

  String _getPerformanceLevel(double? score) {
    if (score == null) return 'Unknown';
    if (score >= 80) return 'Excellent';
    if (score >= 60) return 'Good';
    return 'Needs Improvement';
  }

  IconData _getPerformanceIcon(double? score) {
    if (score == null) return Icons.help_outline;
    if (score >= 80) return Icons.emoji_events;
    if (score >= 60) return Icons.thumb_up;
    return Icons.trending_up;
  }

  Widget _buildScoreCard(double? score) {
    final color = _getScoreColor(score);
    final level = _getPerformanceLevel(score);
    final icon = _getPerformanceIcon(score);

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Predicted Exam Score',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            score?.toStringAsFixed(1) ?? 'N/A',
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'out of 100',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              level,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightCard(String title, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2d3748),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PredictionProvider>(context);
    final score = provider.predictedScore;

    return Scaffold(
      backgroundColor: const Color(0xFFf7fafc),
      appBar: AppBar(
        title: const Text(
          'Prediction Results',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF667eea),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF667eea),
                Color(0xFFf7fafc),
              ],
              stops: [0.0, 0.3],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),

              // Main Score Card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildScoreCard(score),
              ),

              const SizedBox(height: 32),

              // Insights Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Performance Insights',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2d3748),
                      ),
                    ),
                    const SizedBox(height: 16),

                    if (score != null) ...[
                      if (score >= 80) ...[
                        _buildInsightCard(
                          'Excellent Performance',
                          'This student shows strong academic potential with current study habits.',
                          Icons.star,
                          const Color(0xFF48bb78),
                        ),
                        const SizedBox(height: 12),
                        _buildInsightCard(
                          'Maintain Momentum',
                          'Continue current study patterns to sustain high performance.',
                          Icons.trending_up,
                          const Color(0xFF667eea),
                        ),
                      ] else if (score >= 60) ...[
                        _buildInsightCard(
                          'Good Foundation',
                          'Solid performance with room for improvement in key areas.',
                          Icons.school,
                          const Color(0xFFed8936),
                        ),
                        const SizedBox(height: 12),
                        _buildInsightCard(
                          'Enhancement Opportunities',
                          'Focus on study efficiency and resource utilization.',
                          Icons.lightbulb,
                          const Color(0xFF667eea),
                        ),
                      ] else ...[
                        _buildInsightCard(
                          'Improvement Needed',
                          'Additional support and study adjustments recommended.',
                          Icons.support,
                          const Color(0xFFf56565),
                        ),
                        const SizedBox(height: 12),
                        _buildInsightCard(
                          'Action Plan',
                          'Consider tutoring, better study habits, and resource access.',
                          Icons.assignment,
                          const Color(0xFF667eea),
                        ),
                      ],
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Action Buttons
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF667eea).withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          provider.reset();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Make Another Prediction',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF667eea),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: Color(0xFF667eea),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Back to Home',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF667eea),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}