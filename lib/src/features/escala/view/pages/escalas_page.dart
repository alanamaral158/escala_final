import 'package:escala_app/src/features/escala/view/pages/edit_page.dart';
import 'package:escala_app/pallete.dart';
import 'package:flutter/material.dart';
import 'package:escala_app/models/escala.dart';
import 'package:escala_app/src/features/escala/view/pages/detalhes_page.dart';
import 'package:escala_app/repositories/escala_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class EscalaPage extends StatefulWidget {
  const EscalaPage({super.key});

  @override
  State<EscalaPage> createState() => _EscalaPageState();
}

class _EscalaPageState extends State<EscalaPage> {
  

  mostrarDetalhes(Escala escala) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => DetalhesPage(escala: escala)));
  }

  final tabela = EscalaRepository.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tabela.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EscalaEdit(escala: tabela[index])));
            },
            child: Container(
              color: Pallete.backgroundColor,
              child: ListTile(
                leading: const SizedBox(
                  width: 56,
                  height: 75,
                  child: Card(
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(0),
                    color: Pallete.gradient1,
                    child: Icon(Icons.calendar_month,
                        color: Pallete.whiteColor, size: 40),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          builder: (_) => AlertDialog(
                                title: const Text('Excluir Escala'),
                                content: Text(
                                    'Deseja excluir a escala ${tabela[index].data}?'),
                                actions: [
                                  TextButton(
                                      child: const Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color: Pallete.blackColor),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  TextButton(
                                      child: const Text(
                                        'Excluir',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        EscalaRepository.tabela.removeAt(index);
                                        Navigator.pop(context);
                                        setState(() {});
                                      }),
                                ],
                              ),
                          context: context);
                    },
                    icon: const Icon(Icons.delete_outline_outlined, size: 25)),
                onTap: () {
                  mostrarDetalhes(tabela[index]);
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Domingo',
                      style: GoogleFonts.montserratAlternates(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Card(
                          color: Pallete.blackColor,
                          margin: const EdgeInsets.all(0),
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Text(
                              "Culto",
                              style: GoogleFonts.montserratAlternates(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: Pallete.whiteColor),
                            ),
                          )),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text('-')),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          tabela[index].data,
                          style: GoogleFonts.montserratAlternates(
                            fontWeight: FontWeight.w200,
                            fontSize: 13,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
