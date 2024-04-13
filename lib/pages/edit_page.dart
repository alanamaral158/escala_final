import 'package:escala_app/models/escala.dart';
import 'package:escala_app/repositories/escala_repository.dart';
import 'package:flutter/material.dart';

class EscalaEdit extends StatefulWidget {
  final Escala escala;

  EscalaEdit({required this.escala});

  @override
  State<EscalaEdit> createState() => _EscalaEditState();
}

class _EscalaEditState extends State<EscalaEdit> {
  final _formKey = GlobalKey<FormState>();
  final data = TextEditingController();
  final teclado = TextEditingController();
  final violao = TextEditingController();
  final guitarra = TextEditingController();
  final ordem1 = TextEditingController();
  final ordem2 = TextEditingController();
  final ordem3 = TextEditingController();
  final ordem4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Preenchendo os campos com os valores existentes
    data.text = widget.escala.data;
    teclado.text = widget.escala.teclado.nome;
    violao.text = widget.escala.violao.nome;
    guitarra.text = widget.escala.guitarra.nome;
    ordem1.text = widget.escala.ordem[0];
    ordem2.text = widget.escala.ordem[1];
    ordem3.text = widget.escala.ordem[2];
    ordem4.text = widget.escala.ordem[3];
  }

  editar() {
    if (_formKey.currentState!.validate()) {
      // Mantendo o estado de confirmação
      ConfirmationStatus statusTeclado;
      if (widget.escala.teclado.nome == teclado.text) {
        statusTeclado = widget.escala.teclado.confirmationStatus;
      } else {
        statusTeclado = ConfirmationStatus.Pending;
      }

      // Mantendo o estado de confirmação
      ConfirmationStatus statusViolao;
      if (widget.escala.violao.nome == violao.text) {
        statusViolao = widget.escala.violao.confirmationStatus;
      } else {
        statusViolao = ConfirmationStatus.Pending;
      }

      // Mantendo o estado de confirmação CASO
      ConfirmationStatus statusGuitarra;
      if (widget.escala.guitarra.nome == guitarra.text) {
        statusGuitarra = widget.escala.guitarra.confirmationStatus;
      } else {
        statusGuitarra = ConfirmationStatus.Pending;
      }

      // Criando os campos com os texto já definidos para editar
      Equipe novoTeclado =
          Equipe(nome: teclado.text, confirmationStatus: statusTeclado);
      Equipe novoViolao =
          Equipe(nome: violao.text, confirmationStatus: statusViolao);
      Equipe novoGuitarra =
          Equipe(nome: guitarra.text, confirmationStatus: statusGuitarra);

      // Atualizando os valores da escala
      widget.escala.data = data.text;
      widget.escala.teclado = novoTeclado;
      widget.escala.violao = novoViolao;
      widget.escala.guitarra = novoGuitarra;
      widget.escala.ordem = [
        ordem1.text,
        ordem2.text,
        ordem3.text,
        ordem4.text
      ];

      // Atualizando a escala no repositório
      EscalaRepository.atualizar(widget.escala);

      // Navegando de volta
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Editar Escala',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: violao,
                  decoration: InputDecoration(
                    labelText: 'Violão',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: guitarra,
                  decoration: InputDecoration(
                    labelText: 'Guitarra',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                          ),
                        ),
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
                          ),
                        ),
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
                          ),
                        ),
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: editar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Editar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
