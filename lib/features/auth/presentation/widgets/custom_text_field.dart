import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  bool isPassword;
  String label;
  IconData icon;
  TextEditingController controller;
  CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Padding(
      padding: EdgeInsets.only(top: layout.md * 0.8),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: label,
            prefixIcon: Icon(icon, color: Colors.grey),
            suffixIcon:
                isPassword
                    ? const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.grey,
                    )
                    : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: layout.md * 1.05),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(layout.rmd),
              borderSide: BorderSide(color: AppColors.lightGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(layout.rlg),
              borderSide: BorderSide(color: AppColors.lightPrimaryColor),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
