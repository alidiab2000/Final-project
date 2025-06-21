import 'package:flutter/material.dart';

class FieldInputSection extends StatelessWidget {
  final String label;

  final TextEditingController controller;

  const FieldInputSection({
    super.key,
    required this.label,

    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1E640A),
            ),
          ),
          SizedBox(
            width: 140,

            child: TextFormField(
              controller: controller,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Plz enter $label';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
