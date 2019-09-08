import 'package:score_app/enums/postes.dart';

class Joueur {
  int id;
  String prenom;
  String name;
  int numero;
  Postes poste;
  bool estTitulaire;

  Joueur({this.id, this.prenom, this.name, this.numero, this.poste});
}
