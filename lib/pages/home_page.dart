import 'package:escala_app/models/escala.dart';
import 'package:escala_app/pages/add_page.dart';
import 'package:escala_app/pages/detalhes_page.dart';
import 'package:escala_app/pages/escalas_page.dart';
import 'package:escala_app/repositories/escala_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  mostrarDetalhes(Escala escala) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => DetalhesPage(escala: escala)));
  }

  final tabela = EscalaRepository.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(
                  Icons.replay_outlined,
                  color: Colors.black,
                )),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EscalaAdd()),
                );
              },
            )
          ],
          centerTitle: true,
          title: const Text(
            'Escalas Culto',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
          ),
          backgroundColor: Colors.redAccent),
      body: EscalaPage(),
    );
  }
}
