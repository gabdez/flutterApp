import 'package:score_app/models/equipe.dart';

class Match {
  Equipe equipe;
  String nomEquipeAdv; // nom de l'équipe adverse
  bool estDomicile;
  DateTime date;
  bool estFini = false;
  int score1 = 0; // score 1 est toujours le score de l'équipe
  int score2 = 0; // score 2 toujours le score de l'equipe avec juste le nom
  Match({this.equipe, this.nomEquipeAdv, this.estDomicile, this.date});
  Match.jouer(
      {this.equipe,
      this.nomEquipeAdv,
      this.estDomicile,
      this.date,
      this.estFini,
      this.score1,
      this.score2});
}
