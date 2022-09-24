import 'package:activities_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class ReusableButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final ButtonType? buttonType;
  final double? height;
  final double? width;
  const ReusableButton(
      {this.title,
      this.onPressed,
      this.buttonType,
      this.height = 40,
      this.width = double.infinity,
      Key? key})
      : super(key: key);

  ButtonStyle _buttonStyle(ButtonType? buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return ElevatedButton.styleFrom(
          primary: AppColors.navy,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        );

      case ButtonType.secondary:
        return ElevatedButton.styleFrom(
          primary: AppColors.lightSeaGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        );
      default:
        return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title ?? ''),
        style: _buttonStyle(buttonType),
      ),
    );
  }
}
