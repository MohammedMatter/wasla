import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/auth/presentation/widgets/register_success_body.dart';

// ignore: camel_case_types
class RegisterSuccessView extends StatelessWidget {
  const RegisterSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.arrow_circle_right_outlined)]),
      body: RegisterSuccessBody(layout: layout),
    );
  }
}
