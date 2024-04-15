import 'package:escala_app/models/escala.dart';
import 'package:escala_app/repositories/escala_repository.dart';

import 'package:flutter/material.dart';

class EscalaAdd extends StatefulWidget {
  final Function() reloadCallback;
  const EscalaAdd({super.key, required this.reloadCallback});

  @override
  State<EscalaAdd> createState() => _EscalaAddState();
}

class _EscalaAddState extends State<EscalaAdd> {
  final _formKey = GlobalKey<FormState>();
  final data = TextEditingController();
  final teclado = TextEditingController();
  final violao = TextEditingController();
  final guitarra = TextEditingController();
  final ordem1 = TextEditingController();
  final ordem2 = TextEditingController();
  final ordem3 = TextEditingController();
  final ordem4 = TextEditingController();
  final confirmed = TextEditingController();

  adicionar() {
    if (_formKey.currentState!.validate()) {
      Equipe tecladoEquipe = Equipe(
          nome: teclado.text, confirmationStatus: ConfirmationStatus.Pending);
      Equipe violaoEquipe = Equipe(
          nome: violao.text, confirmationStatus: ConfirmationStatus.Pending);
      Equipe guitarraEquipe = Equipe(
          nome: guitarra.text, confirmationStatus: ConfirmationStatus.Pending);

      EscalaRepository.tabela.add(Escala(
        ordem: [
          ordem1.text,
          ordem2.text,
          ordem3.text,
          ordem4.text,
        ],
        data: data.text,
        teclado: tecladoEquipe,
        violao: violaoEquipe,
        guitarra: guitarraEquipe,
      ));

      widget.reloadCallback();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'Adicionar Escala',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: data,
                      decoration: InputDecoration(
                        labelText: 'Data',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira uma data';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: teclado,
                      decoration: InputDecoration(
                          labelText: 'Teclado',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: violao,
                      decoration: InputDecoration(
                          labelText: 'Violão',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: guitarra,
                      decoration: InputDecoration(
                          labelText: 'Guitarra',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: ordem1,
                            decoration: InputDecoration(
                                labelText: 'Ordem 1',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: ordem2,
                            decoration: InputDecoration(
                                labelText: 'Ordem 2',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: ordem3,
                            decoration: InputDecoration(
                                labelText: 'Ordem 3',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: ordem4,
                            decoration: InputDecoration(
                                labelText: 'Ordem 4',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: adicionar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Adicionar'),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
