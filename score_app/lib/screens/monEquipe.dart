import 'package:flutter/material.dart';
import 'package:score_app/enums/postes.dart';
import 'package:score_app/models/joueur.dart';

class MonEquipe extends StatefulWidget {
  const MonEquipe({Key key}) : super(key: key);

  @override
  _MonEquipeState createState() => _MonEquipeState();
}

class _MonEquipeState extends State<MonEquipe> {
  final List<Joueur> _joueurs = [
    Joueur(
        id: 1,
        numero: 23,
        name: 'Fernandez',
        prenom: 'Gabriel',
        poste: Postes.meneur),
    Joueur(
        id: 2,
        numero: 24,
        name: 'Fernandez',
        prenom: 'Valentin',
        poste: Postes.ailier),
    Joueur(
        id: 3,
        numero: 45,
        name: 'Fernandez',
        prenom: 'Sofia',
        poste: Postes.arriere),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white30,
            height: double.infinity,
            width: double.infinity,
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  _updateMyItems(oldIndex, newIndex);
                });
              },
              children: <Widget>[
                for (final joueur in _joueurs)
                  Container(
                    key: ValueKey(joueur.id),
                    child: ListTile(
                      title: Text(joueur.prenom),
                      isThreeLine: true,
                      subtitle: Text(joueur.poste.toString()),
                    ),
                    color: Colors.blueAccent,
                  )
              ],
            )));
  }

  void _updateMyItems(int oldIndex, int newIndex) {
    print('onreorder');
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final joueur = _joueurs.removeAt(oldIndex);
    _joueurs.insert(newIndex, joueur);
  }
}
