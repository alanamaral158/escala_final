import 'package:escala_app/src/features/escala/widgets/gradient_button.dart';
import 'package:escala_app/src/features/escala/widgets/login_field.dart';
import 'package:escala_app/src/features/escala/widgets/social_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                SocialButton(
                    iconName: 'g_icon',
                    label: ('Entrar com Google'),
                    horizontalPadding: 80,
                    onPressed: () {}),
                const SizedBox(height: 20),
                SocialButton(
                    iconName: 'f_icon',
                    label: ('Entrar com Facebook'),
                    onPressed: () {}),
                const SizedBox(height: 15),
                const Text('ou', style: TextStyle(fontSize: 17)),
                const SizedBox(height: 15),
                const LoginField(hintText: 'E-mail'),
                const SizedBox(height: 15),
                const LoginField(hintText: 'Senha', isPasswordField: true),
                const SizedBox(height: 20),
                const GradientButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
