import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool? obscureText;
  final InputDecoration decoration;
  const TextFieldWidget(
      {super.key,
      this.obscureText,
      required this.hint,
      required this.controller,
      required this.decoration});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: decoration..copyWith(hintText: hint),
      validator: (input) {
        if (controller.text.isNotEmpty) {
          return null;
        } else {
          return "$hint must not be empty";
        }
      },
    );
  }
}
// const TextField(
                  //   decoration: InputDecoration(
                  //       suffixIcon: Icon(
                  //         Icons.check,
                  //         color: AppColors.grey,
                  //       ),
                  //       label: Text(
                  //         'Gmail',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: AppColors.Basic1,
                  //         ),
                  //       )),
                  // ),
                  // const TextField(
                  //   decoration: InputDecoration(
                  //       suffixIcon: Icon(
                  //         Icons.visibility_off,
                  //         color: AppColors.grey,
                  //       ),
                  //       label: Text(
                  //         'Password',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: AppColors.Basic1,
                  //         ),
                  //       )),
                  // ),

// const TextField(
                  //   decoration: InputDecoration(
                  //       suffixIcon: Icon(
                  //         Icons.check,
                  //         color: AppColors.grey,
                  //       ),
                  //       label: Text(
                  //         'Gmail',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: AppColors.Basic1,
                  //         ),
                  //       )),
                  // ),
                  // const TextField(
                  //   decoration: InputDecoration(
                  //       suffixIcon: Icon(
                  //         Icons.visibility_off,
                  //         color: AppColors.grey,
                  //       ),
                  //       label: Text(
                  //         'Password',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: AppColors.Basic1,
                  //         ),
                  //       )),
                  // ),