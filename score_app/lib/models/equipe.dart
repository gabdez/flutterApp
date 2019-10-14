import 'package:score_app/models/joueur.dart';

class Equipe {
  int id;
  String name;
  List<Joueur> joueurs = [];

  //constructors
  Equipe({this.id, this.name});
  Equipe.avecJoueurs(int id, String name, List<Joueur> joueurs) {
    this.id = id;
    this.name = name;
    this.joueurs = joueurs;
  }
}
