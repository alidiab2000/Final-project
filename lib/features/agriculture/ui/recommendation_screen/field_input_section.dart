import 'package:flutter/material.dart';

class FieldInputSection extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool? check;
  const FieldInputSection({
    super.key,
    required this.label,
    this.hint,
    this.check,
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
                if (check == true) {
                  if (int.parse(value) < 50 || int.parse(value) > 150) {
                    return "value be in between 50 - 150";
                  }
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hint: Text(hint ?? "Mn", textAlign: TextAlign.center),
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
