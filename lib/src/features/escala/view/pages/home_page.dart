import 'package:escala_app/models/escala.dart';
import 'package:escala_app/src/features/escala/view/pages/add_page.dart';
import 'package:escala_app/src/features/escala/view/pages/detalhes_page.dart';
import 'package:escala_app/src/features/escala/view/pages/escalas_page.dart';
import 'package:escala_app/pallete.dart';
import 'package:escala_app/repositories/escala_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  reloadPage() {
    setState(() {});
  }

  mostrarDetalhes(Escala escala) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => DetalhesPage(escala: escala)));
  }

  final tabela = EscalaRepository.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 32,
                color: Pallete.whiteColor,
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddPage(reloadCallback: reloadPage)),
                );
                if (result) setState(() {});
              },
            ),
          )
        ],
        title: const Text(
          'Escalas Culto',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
          colors: [Pallete.gradient1, Pallete.gradient2, Pallete.gradient3],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ))),
      ),
      body: const EscalaPage(),
    );
  }
}
