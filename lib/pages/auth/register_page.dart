import 'package:flutter/material.dart';
import 'package:groupchat/pages/auth/login_page.dart';
import 'package:groupchat/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Register"),
      onPressed: () {
        nextScreen(context, const LoginPage());
      },
    );
  }
}
