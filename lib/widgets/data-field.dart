import 'package:flutter/material.dart';
import 'package:smg_buddy_app/theme/app_colors.dart';
import 'package:smg_buddy_app/theme/app_styles.dart';

class DataField extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
  final TextInputType? textInputType;
  final bool obscure;
  final bool enabled;
  final int maxLength;

  const DataField(
      {super.key,
        required this.hintText,
        this.initialValue,
        this.onChanged,
        this.validator,
        this.onPressed,
        this.textInputType,
        this.obscure = false,
        this.enabled = true,
        this.maxLength = 10});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      enabled: enabled,
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onPressed,
      obscureText: obscure,
      maxLength: maxLength,
      validator: validator ?? (v) => null,
      keyboardType: textInputType ?? TextInputType.text,
      style: Styles.tsDataTextRegular14,
cursorColor: AppColors.dataColour,
      decoration: InputDecoration(
        counterText: "",
          labelText: hintText,
          hintStyle: Styles.tsDataTextRegular14,
          labelStyle: const TextStyle(
            color: AppColors.dataColour
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.dataColour, width: 1)
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.dataColour, width: 2)
          )
      ),
    );
  }
}
