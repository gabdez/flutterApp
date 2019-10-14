import 'package:flutter/material.dart';
import 'package:score_app/enums/postes.dart';
import 'package:score_app/models/equipe.dart';
import 'package:score_app/models/joueur.dart';

class EquipesProvider with ChangeNotifier {
  List<Equipe> _items = [
    Equipe.avecJoueurs(1, "Achères", [
      Joueur(
          id: 1,
          name: "Fernandez",
          prenom: "Gabriel",
          numero: 23,
          poste: Postes.arriere,
          estTitulaire: true)
    ]),
    Equipe(id: 2, name: 'Poissy'),
  ];

  Equipe _currentEquipe;

  List<Equipe> get items {
    return [..._items];
  }

  Equipe get currentEquipe {
    return _currentEquipe;
  }

  set currentEquipe(value) {
    _currentEquipe = value;
  }

  void addEquipe(value) {
    _items.add(Equipe(id: _items.length + 1, name: value));
    notifyListeners();
  }

  void addJoueur(Equipe equipe, Joueur joueur) {
    equipe.joueurs.add(joueur);
    notifyListeners();
  }
}
