import 'package:flutter/material.dart';
import 'package:score_app/enums/postes.dart';
import 'package:score_app/models/equipe.dart';
import 'package:score_app/models/joueur.dart';
import 'package:score_app/models/match.dart' as m;

class MatchsProvider with ChangeNotifier {
  Map _matchsMap = Map<int, List<m.Match>>();
  Equipe equipe = Equipe.avecJoueurs(1, "Achères", [
    Joueur(
        id: 1,
        name: "Fernandez",
        prenom: "Gabriel",
        numero: 23,
        poste: Postes.arriere,
        estTitulaire: true)
  ]);

  Map get matchsMap {
    return _matchsMap;
  }

  List<m.Match> getListeMatchJoue(int key) {
    return _matchsMap[key].where((m) => m.estFini == true).toList();
  }

  List<m.Match> getListeMatchAVenir(int key) {
    return _matchsMap[key].where((m) => m.estFini == false).toList();
  }

  List<m.Match> getListeMatch(int key) {
    return _matchsMap[key];
  }

  void addMatch(int key, m.Match match) {
    _matchsMap[key].add(match);
    notifyListeners();
  }

  MatchsProvider() {
    // initialisation mocks
    _matchsMap[1] = [
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Conflans',
          estDomicile: true,
          date: DateTime.now(),
          estFini: true,
          score1: 88,
          score2: 90),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Conflans',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 90,
          score2: 50),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Marly',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 100,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Paris',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 70,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match.jouer(
          equipe: equipe,
          nomEquipeAdv: 'Villeurbanne',
          estDomicile: false,
          date: DateTime.now(),
          estFini: true,
          score1: 20,
          score2: 88),
      m.Match(
        equipe: equipe,
        nomEquipeAdv: 'Poissy',
        estDomicile: true,
        date: DateTime.now(),
      ),
      m.Match(
        equipe: equipe,
        nomEquipeAdv: 'Sartrouville',
        estDomicile: false,
        date: DateTime.now(),
      ),
      m.Match(
        equipe: equipe,
        nomEquipeAdv: 'Velizy',
        estDomicile: false,
        date: DateTime.now(),
      ),
      m.Match(
        equipe: equipe,
        nomEquipeAdv: 'Poissy',
        estDomicile: true,
        date: DateTime.now(),
      ),
    ];
  }
}
