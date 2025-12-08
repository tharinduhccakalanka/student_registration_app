import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.isObscure = false,
    this.controller,
  });

  final String hintText;
  final String labelText;
  final bool isObscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
