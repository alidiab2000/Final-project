import '../../themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
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
    this.validator,
  });
  final String hint;
  final String label;
  final int maxlines;

  final bool suffix;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      obscureText: widget.suffix ? obscureText : false,
      obscuringCharacter: "*",
      maxLines: widget.maxlines,
      controller: widget.controller,
      cursorColor: ColorsManager.gray,
      style: const TextStyle(color: ColorsManager.gray),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        filled: true,
        fillColor: ColorsManager.grayWithOpacity.withValues(alpha: 0.5),
        suffix:
            widget.suffix
                ? GestureDetector(
                  onTap:
                      () => setState(() {
                        obscureText = !obscureText;
                      }),
                  child: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: ColorsManager.gray,
                  ),
                )
                : null,
        label: Text(
          widget.label,
          style: const TextStyle(color: ColorsManager.gray),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: ColorsManager.gray),
        border: buildBorder(Colors.white),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(ColorsManager.gray),
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
