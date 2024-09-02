import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/text_styles.dart';
import '../../../Constants/ui_styles.dart';


class InstituteTextFormField extends StatelessWidget {
  const InstituteTextFormField({
    super.key,
    this.controller,
    this.hintText = '',
    this.borderColor = UIColors.primary,
    this.keyboardType = TextInputType.name,
    this.style = UITextStyle.smallBodyNormal,
    this.maxLines = 1,
    this.onChanged,
    this.obscureText = false, // Default to false
  });

  final String hintText;
  final TextEditingController? controller; // Define controller as optional
  final TextInputType keyboardType;
  final TextStyle style;
  final int maxLines;
  final Color borderColor;
  final void Function(String)? onChanged; // Define onChanged as an optional function
  final bool obscureText; // Add this property

  @override
  Widget build(BuildContext context) {
    final TextEditingController effectiveController =
        controller ?? TextEditingController(); // Use provided controller or create a temporary one

    return TextFormField(
      controller: effectiveController,
      keyboardType: keyboardType,
      style: style,
      maxLines: maxLines,
      onChanged: onChanged, // Pass onChanged to TextFormField
      obscureText: obscureText, // Apply obscureText to TextFormField
      decoration: textFieldStyle.copyWith(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
      ),
    );
  }
}
