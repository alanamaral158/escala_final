import 'package:escala_app/src/features/escala/view/pages/login_page.dart';
import 'package:escala_app/pallete.dart';
import 'package:flutter/material.dart';

class EscalaApp extends StatelessWidget {
  const EscalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escala App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: const LoginPage(),
    );
  }
}
