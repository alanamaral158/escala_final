import 'package:escala_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class EscalaApp extends StatelessWidget {
  const EscalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escala App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      home: HomePage(),
    );
  }
}
