import 'package:flutter/material.dart';

enum ConfirmationStatus {
  Confirmed,
  Pending,
  NotConfirmed,
}

Color getColorForConfirmationStatus(ConfirmationStatus status) {
  switch (status) {
    case ConfirmationStatus.Confirmed:
      return Colors.green;
    case ConfirmationStatus.Pending:
      return const Color.fromARGB(255, 249, 194, 43);
    case ConfirmationStatus.NotConfirmed:
      return Colors.red;
    default:
      return Colors.grey;
  }
}

String getTextForConfirmationStatus(ConfirmationStatus status) {
  switch (status) {
    case ConfirmationStatus.Confirmed:
      return "Confirmado";
    case ConfirmationStatus.Pending:
      return "Aguardando confirmação";
    case ConfirmationStatus.NotConfirmed:
      return "Não confirmado";
    default:
      return "Desconhecido";
  }
}

class Equipe {
  String nome;
  ConfirmationStatus confirmationStatus;

  Equipe({
    required this.confirmationStatus,
    required this.nome,
  });
}

class Escala {
  String data;
  Equipe teclado;
  Equipe violao;
  Equipe guitarra;
  List<String> ordem;

  Escala({
    required this.ordem,
    required this.data,
    required this.teclado,
    required this.violao,
    required this.guitarra,
  });
}
