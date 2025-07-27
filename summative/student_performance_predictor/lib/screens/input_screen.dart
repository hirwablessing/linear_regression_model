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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PredictionProvider>(context);
    final input = provider.input;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Student Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Numeric Input Fields
              InputField(
                label: 'Hours Studied (per week)',
                value: input.hoursStudied.toString(),
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
              const SizedBox(height: 16),
              
              InputField(
                label: 'Attendance Percentage',
                value: input.attendance.toString(),
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
              const SizedBox(height: 16),
              
              InputField(
                label: 'Previous Exam Scores',
                value: input.previousScores.toString(),
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
              const SizedBox(height: 16),
              
              InputField(
                label: 'Sleep Hours (per night)',
                value: input.sleepHours.toString(),
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
              const SizedBox(height: 16),
              
              InputField(
                label: 'Tutoring Sessions (per month)',
                value: input.tutoringSessions.toString(),
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
              const SizedBox(height: 16),
              
              InputField(
                label: 'Physical Activity (hours per week)',
                value: input.physicalActivity.toString(),
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
              const SizedBox(height: 16),
              
              InputField(
                label: 'Study Efficiency',
                value: input.studyEfficiency.toString(),
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
              const SizedBox(height: 16),
              
              InputField(
                label: 'Sleep to Study Ratio',
                value: input.sleepStudyRatio.toString(),
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
              const SizedBox(height: 16),
              
              // Categorical Input Fields
              DropdownButtonFormField<String>(
                value: input.parentalInvolvement,
                decoration: const InputDecoration(
                  labelText: 'Parental Involvement',
                  border: OutlineInputBorder(),
                ),
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    parentalInvolvement: value ?? 'Medium',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.accessToResources,
                decoration: const InputDecoration(
                  labelText: 'Access to Resources',
                  border: OutlineInputBorder(),
                ),
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    accessToResources: value ?? 'Medium',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.motivationLevel,
                decoration: const InputDecoration(
                  labelText: 'Motivation Level',
                  border: OutlineInputBorder(),
                ),
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    motivationLevel: value ?? 'Medium',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.extracurricularActivities,
                decoration: const InputDecoration(
                  labelText: 'Extracurricular Activities',
                  border: OutlineInputBorder(),
                ),
                items: yesNoOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    extracurricularActivities: value ?? 'Yes',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.internetAccess,
                decoration: const InputDecoration(
                  labelText: 'Internet Access',
                  border: OutlineInputBorder(),
                ),
                items: yesNoOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    internetAccess: value ?? 'Yes',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.familyIncome,
                decoration: const InputDecoration(
                  labelText: 'Family Income',
                  border: OutlineInputBorder(),
                ),
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    familyIncome: value ?? 'Medium',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.teacherQuality,
                decoration: const InputDecoration(
                  labelText: 'Teacher Quality',
                  border: OutlineInputBorder(),
                ),
                items: options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    teacherQuality: value ?? 'Medium',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.schoolType,
                decoration: const InputDecoration(
                  labelText: 'School Type',
                  border: OutlineInputBorder(),
                ),
                items: schoolOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    schoolType: value ?? 'Public',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.peerInfluence,
                decoration: const InputDecoration(
                  labelText: 'Peer Influence',
                  border: OutlineInputBorder(),
                ),
                items: peerOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    peerInfluence: value ?? 'Positive',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.learningDisabilities,
                decoration: const InputDecoration(
                  labelText: 'Learning Disabilities',
                  border: OutlineInputBorder(),
                ),
                items: yesNoOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    learningDisabilities: value ?? 'No',
                  ));
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<String>(
                value: input.parentalEducationLevel,
                decoration: const InputDecoration(
                  labelText: 'Parental Education Level',
                  border: OutlineInputBorder(),
                ),
                items: educationOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  provider.updateInput(input.copyWith(
                    parentalEducationLevel: value ?? 'College',
                  ));
                },
              ),
              const SizedBox(height: 24),
              
              ElevatedButton(
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
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Predict Performance'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}