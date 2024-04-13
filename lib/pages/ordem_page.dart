import 'package:flutter/material.dart';
import 'package:escala_app/models/escala.dart';

// ignore: must_be_immutable
class OrdemPage extends StatefulWidget {
  OrdemPage({super.key, required this.escala});

  Escala escala;

  @override
  State<OrdemPage> createState() => _OrdemPageState();
}

class _OrdemPageState extends State<OrdemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          padding: const EdgeInsets.only(top: 15),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  widget.escala.ordem[index],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
          separatorBuilder: (_, __) => const Divider(height: 30, thickness: 2),
          itemCount: widget.escala.ordem.length),
    );
  }
}
