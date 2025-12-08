import 'package:flutter/material.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
    this.color = AppColors.primaryColor,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}
