import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/auth/presentation/widgets/password_changed_success_body.dart';

class PasswordChangedSuccessView extends StatelessWidget {
  const PasswordChangedSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: PasswordChangedSuccessBody(layout: layout),
    );
  }
}
