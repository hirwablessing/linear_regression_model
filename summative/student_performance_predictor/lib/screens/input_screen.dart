import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_performance_predictor/models/prediction_input.dart';
import 'package:student_performance_predictor/providers/prediction_provider.dart';
import 'package:student_performance_predictor/screens/results_screen.dart';
import 'package:student_performance_predictor/widgets/input_field.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> options = ['Low', 'Medium', 'High'];
  final List<String> yesNoOptions = ['Yes', 'No'];
  final List<String> peerOptions = ['Positive', 'Neutral', 'Negative'];
  final List<String> educationOptions = ['High School', 'College', 'Postgraduate'];
  final List<String> schoolOptions = ['Public', 'Private'];

  Widget _buildSectionHeader(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF667eea), Color(0xFF764ba2)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2d3748),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF667eea).withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String value,
    required Function(String) onChanged,
    required String? Function(String?) validator,
    String? hint,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4a5568),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: value == '0' ? '' : value,
            onChanged: onChanged,
            validator: validator,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF667eea), width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
    IconData? prefixIcon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4a5568),
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF667eea), width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: const Color(0xFF667eea), size: 20)
                  : null,
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PredictionProvider>(context);
    final input = provider.input;

    return Scaffold(
      backgroundColor: const Color(0xFFf7fafc),
      appBar: AppBar(
        title: const Text(
          'Student Details',
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
              // Header Section
              Container(
                padding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.edit_note,
                        size: 32,
                        color: Color(0xFF667eea),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Complete Student Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2d3748),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Fill in all details for accurate prediction',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Form Content
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Study Habits Section
                      _buildSectionHeader('Study Habits', Icons.school),

                      _buildInputField(
                        label: 'Hours Studied (per week)',
                        value: input.hoursStudied.toString(),
                        hint: 'e.g., 15',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            hoursStudied: double.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = double.tryParse(value);
                          if (val == null || val < 0 || val > 50) {
                            return 'Enter value 0-50';
                          }
                          return null;
                        },
                      ),

                      _buildInputField(
                        label: 'Study Efficiency',
                        value: input.studyEfficiency.toString(),
                        hint: 'e.g., 8.5',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            studyEfficiency: double.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = double.tryParse(value);
                          if (val == null || val < 0) {
                            return 'Enter positive number';
                          }
                          return null;
                        },
                      ),

                      _buildInputField(
                        label: 'Tutoring Sessions (per month)',
                        value: input.tutoringSessions.toString(),
                        hint: 'e.g., 4',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            tutoringSessions: int.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = int.tryParse(value);
                          if (val == null || val < 0) {
                            return 'Enter positive number';
                          }
                          return null;
                        },
                      ),

                      // Academic Performance Section
                      _buildSectionHeader('Academic Performance', Icons.trending_up),

                      _buildInputField(
                        label: 'Attendance Percentage',
                        value: input.attendance.toString(),
                        hint: 'e.g., 85',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            attendance: double.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = double.tryParse(value);
                          if (val == null || val < 0 || val > 100) {
                            return 'Enter value 0-100';
                          }
                          return null;
                        },
                      ),

                      _buildInputField(
                        label: 'Previous Exam Scores',
                        value: input.previousScores.toString(),
                        hint: 'e.g., 78',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            previousScores: double.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = double.tryParse(value);
                          if (val == null || val < 0 || val > 100) {
                            return 'Enter value 0-100';
                          }
                          return null;
                        },
                      ),

                      // Health & Lifestyle Section
                      _buildSectionHeader('Health & Lifestyle', Icons.favorite),

                      _buildInputField(
                        label: 'Sleep Hours (per night)',
                        value: input.sleepHours.toString(),
                        hint: 'e.g., 7.5',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            sleepHours: double.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = double.tryParse(value);
                          if (val == null || val < 0 || val > 24) {
                            return 'Enter value 0-24';
                          }
                          return null;
                        },
                      ),

                      _buildInputField(
                        label: 'Physical Activity (hours per week)',
                        value: input.physicalActivity.toString(),
                        hint: 'e.g., 5',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            physicalActivity: int.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = int.tryParse(value);
                          if (val == null || val < 0) {
                            return 'Enter positive number';
                          }
                          return null;
                        },
                      ),

                      _buildInputField(
                        label: 'Sleep to Study Ratio',
                        value: input.sleepStudyRatio.toString(),
                        hint: 'e.g., 0.5',
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            sleepStudyRatio: double.tryParse(value) ?? 0,
                          ));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Required';
                          final val = double.tryParse(value);
                          if (val == null || val < 0) {
                            return 'Enter positive number';
                          }
                          return null;
                        },
                      ),

                      // Family & Support Section
                      _buildSectionHeader('Family & Support', Icons.family_restroom),

                      _buildDropdownField(
                        label: 'Parental Involvement',
                        value: input.parentalInvolvement,
                        items: options,
                        prefixIcon: Icons.supervisor_account,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            parentalInvolvement: value ?? 'Medium',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'Parental Education Level',
                        value: input.parentalEducationLevel,
                        items: educationOptions,
                        prefixIcon: Icons.school,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            parentalEducationLevel: value ?? 'College',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'Family Income',
                        value: input.familyIncome,
                        items: options,
                        prefixIcon: Icons.attach_money,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            familyIncome: value ?? 'Medium',
                          ));
                        },
                      ),

                      // Resources & Environment Section
                      _buildSectionHeader('Resources & Environment', Icons.business_center),

                      _buildDropdownField(
                        label: 'Access to Resources',
                        value: input.accessToResources,
                        items: options,
                        prefixIcon: Icons.library_books,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            accessToResources: value ?? 'Medium',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'Internet Access',
                        value: input.internetAccess,
                        items: yesNoOptions,
                        prefixIcon: Icons.wifi,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            internetAccess: value ?? 'Yes',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'School Type',
                        value: input.schoolType,
                        items: schoolOptions,
                        prefixIcon: Icons.location_city,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            schoolType: value ?? 'Public',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'Teacher Quality',
                        value: input.teacherQuality,
                        items: options,
                        prefixIcon: Icons.person,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            teacherQuality: value ?? 'Medium',
                          ));
                        },
                      ),

                      // Personal Factors Section
                      _buildSectionHeader('Personal Factors', Icons.psychology),

                      _buildDropdownField(
                        label: 'Motivation Level',
                        value: input.motivationLevel,
                        items: options,
                        prefixIcon: Icons.emoji_events,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            motivationLevel: value ?? 'Medium',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'Peer Influence',
                        value: input.peerInfluence,
                        items: peerOptions,
                        prefixIcon: Icons.group,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            peerInfluence: value ?? 'Positive',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'Extracurricular Activities',
                        value: input.extracurricularActivities,
                        items: yesNoOptions,
                        prefixIcon: Icons.sports,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            extracurricularActivities: value ?? 'Yes',
                          ));
                        },
                      ),

                      _buildDropdownField(
                        label: 'Learning Disabilities',
                        value: input.learningDisabilities,
                        items: yesNoOptions,
                        prefixIcon: Icons.accessibility,
                        onChanged: (value) {
                          provider.updateInput(input.copyWith(
                            learningDisabilities: value ?? 'No',
                          ));
                        },
                      ),

                      const SizedBox(height: 32),

                      // Submit Button
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await provider.predict();
                              if (provider.error == null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ResultsScreen(),
                                  ),
                                );
                              }
                            }
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
                                Icons.analytics,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Predict Performance',
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

                      const SizedBox(height: 24),
                    ],
                  ),
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