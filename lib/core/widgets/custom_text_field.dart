import 'package:final_project/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    this.maxlines = 1,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.suffix = false,
    required this.controller,
  });
  final String hint;
  final String label;
  final int maxlines;
  final bool suffix;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.grayWithOpacity.withValues(alpha: 0.5),
        ),
        child: TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Field is Requierd";
            }
            return null;
          },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },

          onChanged: onChanged,
          onSaved: onSaved,
          obscureText: obscureText,
          maxLines: maxlines,
          controller: controller,
          cursorColor: ColorsManager.gray,
          style: const TextStyle(color: ColorsManager.gray),
          decoration: InputDecoration(
            suffix:
                suffix
                    ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: ColorsManager.gray,
                      ),
                    )
                    : null,
            label: Text(
              label,
              style: const TextStyle(color: ColorsManager.gray),
            ),
            hintText: hint,
            hintStyle: const TextStyle(color: ColorsManager.gray),
            border: buildBorder(Colors.white),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(ColorsManager.gray),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
