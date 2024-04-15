import 'package:escala_app/models/escala.dart';
import 'package:escala_app/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EquipePage extends StatefulWidget {
  EquipePage({super.key, required this.escala});
  Escala escala;

  @override
  State<EquipePage> createState() => _EquipePageState();
}

class _EquipePageState extends State<EquipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(65, 158, 158, 158),
            width: double.infinity,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 7, bottom: 6),
              child: Text(
                'Pregador',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 3,
            height: 0,
            color: Pallete.gradient2,
          ),
          SizedBox(
            width: double.infinity,
            height: 90,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 50,
                      color: Pallete.gradient1,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Pr Gustavo',
                                style: GoogleFonts.montserratAlternates(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Card(
                                  color: Colors.green,
                                  margin: EdgeInsets.all(0),
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text(
                                      "Confirmado",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.white),
                                    ),
                                  )),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text('Pregador',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    )))
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(65, 158, 158, 158),
            width: double.infinity,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 7, bottom: 6),
              child: Text(
                'Banda',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 3,
            height: 0,
            color: Pallete.gradient2,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 90,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 50,
                      color: Pallete.gradient1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.escala.teclado.nome,
                              style: GoogleFonts.montserratAlternates(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  switch (widget
                                      .escala.teclado.confirmationStatus) {
                                    case ConfirmationStatus.Confirmed:
                                      widget.escala.teclado.confirmationStatus =
                                          ConfirmationStatus.Pending;
                                      break;
                                    case ConfirmationStatus.Pending:
                                      widget.escala.teclado.confirmationStatus =
                                          ConfirmationStatus.NotConfirmed;
                                      break;
                                    case ConfirmationStatus.NotConfirmed:
                                      widget.escala.teclado.confirmationStatus =
                                          ConfirmationStatus.Confirmed;
                                      break;
                                  }
                                });
                              },
                              child: Card(
                                color: getColorForConfirmationStatus(
                                    widget.escala.teclado.confirmationStatus),
                                margin: const EdgeInsets.all(0),
                                clipBehavior: Clip.antiAlias,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    getTextForConfirmationStatus(widget
                                        .escala.teclado.confirmationStatus),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Teclado',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              thickness: 1,
              height: 0,
              color: Color.fromARGB(121, 158, 158, 158),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 90,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 50,
                      color: Pallete.gradient1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.escala.violao.nome,
                              style: GoogleFonts.montserratAlternates(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  switch (
                                      widget.escala.violao.confirmationStatus) {
                                    case ConfirmationStatus.Confirmed:
                                      widget.escala.violao.confirmationStatus =
                                          ConfirmationStatus.Pending;
                                      break;
                                    case ConfirmationStatus.Pending:
                                      widget.escala.violao.confirmationStatus =
                                          ConfirmationStatus.NotConfirmed;
                                      break;
                                    case ConfirmationStatus.NotConfirmed:
                                      widget.escala.violao.confirmationStatus =
                                          ConfirmationStatus.Confirmed;
                                      break;
                                  }
                                });
                              },
                              child: Card(
                                color: getColorForConfirmationStatus(
                                    widget.escala.violao.confirmationStatus),
                                margin: const EdgeInsets.all(0),
                                clipBehavior: Clip.antiAlias,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    getTextForConfirmationStatus(widget
                                        .escala.violao.confirmationStatus),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Violão',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              thickness: 1,
              height: 0,
              color: Color.fromARGB(121, 158, 158, 158),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 90,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 50,
                      color: Pallete.gradient1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.escala.guitarra.nome,
                              style: GoogleFonts.montserratAlternates(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  switch (widget
                                      .escala.guitarra.confirmationStatus) {
                                    case ConfirmationStatus.Confirmed:
                                      widget.escala.guitarra
                                              .confirmationStatus =
                                          ConfirmationStatus.Pending;
                                      break;
                                    case ConfirmationStatus.Pending:
                                      widget.escala.guitarra
                                              .confirmationStatus =
                                          ConfirmationStatus.NotConfirmed;
                                      break;
                                    case ConfirmationStatus.NotConfirmed:
                                      widget.escala.guitarra
                                              .confirmationStatus =
                                          ConfirmationStatus.Confirmed;
                                      break;
                                  }
                                });
                              },
                              child: Card(
                                color: getColorForConfirmationStatus(
                                    widget.escala.guitarra.confirmationStatus),
                                margin: const EdgeInsets.all(0),
                                clipBehavior: Clip.antiAlias,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    getTextForConfirmationStatus(widget
                                        .escala.guitarra.confirmationStatus),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Guitarra',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
