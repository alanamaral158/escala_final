import 'package:escala_app/models/escala.dart';
import 'package:escala_app/pages/equipe_page.dart';
import 'package:escala_app/pages/ordem_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetalhesPage extends StatefulWidget {
  Escala escala;

  DetalhesPage({super.key, required this.escala});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          elevation: 3,
          title: Text('Escala ${widget.escala.data}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 5),
          child: DefaultTabController(
            length: 2,
            child: Column(children: [
              Material(
                child: Container(
                  height: 65,
                  color: Colors.grey[050],
                  child: TabBar(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      unselectedLabelColor: Colors.red,
                      labelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent),
                      tabs: [
                        Tab(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                  ),
                                  Text("Equipe"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.redAccent, width: 1)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text("Ordem"),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Center(
                    child: EquipePage(escala: widget.escala),
                  ),
                  Center(
                    child: OrdemPage(escala: widget.escala),
                  ),
                ]),
              )
            ]),
          ),
        ));
  }
}
