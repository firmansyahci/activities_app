import 'package:activities_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final bool readOnly;
  final int? maxLines;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  const ReusableTextField(
      {this.hintText,
      this.suffixIcon,
      this.readOnly = false,
      this.maxLines,
      this.keyboardType,
      this.onTap,
      this.controller,
      this.textInputAction,
      this.validator,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      Key? key})
      : super(key: key);

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: AppColors.gainsboro,
      ),
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
    );
  }
}
