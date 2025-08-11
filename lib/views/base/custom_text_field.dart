import 'package:find_me_a_coach/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscure;
  final Color? filColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final bool? isEmail;
  final bool? filled;
  final int? maxLines;

  const CustomTextField(
      {super.key,
        this.contentPaddingHorizontal,
        this.contentPaddingVertical,
        this.hintText,
        this.prefixIcon,
        this.suffixIcon,
        this.validator,
        this.isEmail,
        required this.controller,
        this.keyboardType = TextInputType.text,
        this.isObscureText = false,
        this.obscure = '*',
        this.filColor,
        this.maxLines = 1,
        this.filled,
        this.labelText,
        this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscuringCharacter: widget.obscure!,
        maxLines: widget.maxLines,
        validator: widget.validator ??
                (value) {
              if (widget.isEmail == null) {
                if (value!.isEmpty) {
                  return "Please enter ${widget.hintText!.toLowerCase()}";
                } else if (widget.isPassword) {
                  bool data = AppConstants.passwordValidator.hasMatch(value);
                  if (value.isEmpty) {
                    return "Please enter ${widget.hintText!.toLowerCase()}";
                  } else if (!data) {
                    return "Insecure password detected.";
                  }
                }
              } else {
                bool data = AppConstants.emailValidator.hasMatch(value!);
                if (value.isEmpty) {
                  return "Please enter ${widget.hintText!.toLowerCase()}";
                } else if (!data) {
                  return "Please check your email!";
                }
              }
              return null;
            },
        cursorColor: AppColors.primaryColor,
        obscureText: widget.isPassword ? obscureText : false,
        style: AppStyles.h4(color: AppColors.fillTextColor, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.contentPaddingHorizontal ?? 20,
              vertical: widget.contentPaddingVertical ?? 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.borderColor,
                width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.borderColor,
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.borderColor,
                width: 1),
          ),
          filled: widget.filled,
          fillColor: widget.filColor,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? GestureDetector(
            onTap: toggle,
            child: _suffixIcon(
                obscureText ? Icons.visibility_off : Icons.visibility),
          )
              : widget.suffixIcon,
          prefixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: AppStyles.h4(color: AppColors.fillTextColor, fontWeight: FontWeight.w400),

        ),
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(12.0), child: Icon(icon,
      color: AppColors.primaryColor,));
  }
}

