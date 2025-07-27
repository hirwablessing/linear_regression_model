import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String value;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        initialValue: value,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}