import 'package:escala_app/models/escala.dart';

class EscalaRepository {
  static List<Escala> tabela = [
    Escala(
      data: '01/01/2022',
      ordem: [
        'Galileu (A)',
        'Deus me ama (G)',
        'Nada é impossível (Dm)',
        'Em nome de Jesus (C)'
      ],
      teclado: Equipe(
          nome: 'Victor', confirmationStatus: ConfirmationStatus.Pending),
      violao:
          Equipe(nome: 'Lucas', confirmationStatus: ConfirmationStatus.Pending),
      guitarra:
          Equipe(nome: 'Pedro', confirmationStatus: ConfirmationStatus.Pending),
    ),
    Escala(
      data: '02/01/2022',
      ordem: [
        'Poder do teu amor (F)',
        'Jesus em tua presença (F)',
        'Leão de juda (Dm)',
        'Grande é o senhor (C)'
      ],
      teclado: Equipe(
          nome: 'Laura', confirmationStatus: ConfirmationStatus.Confirmed),
      violao: Equipe(
          nome: 'Mateus', confirmationStatus: ConfirmationStatus.Pending),
      guitarra: Equipe(
          nome: 'João', confirmationStatus: ConfirmationStatus.NotConfirmed),
    ),
  ];

  static void atualizar(Escala escalaAtualizada) {
    for (int i = 0; i < tabela.length; i++) {
      if (tabela[i].data == escalaAtualizada.data) {
        tabela[i] = escalaAtualizada;
        break;
      }
    }
  }
}
