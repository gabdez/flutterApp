import 'package:flutter/material.dart';
import 'package:score_app/models/equipe.dart';

class EquipesProvider with ChangeNotifier {
  List<Equipe> _items = [
    Equipe(id: 1, name: 'Achères'),
    Equipe(id: 2, name: 'Poissy')
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
}
