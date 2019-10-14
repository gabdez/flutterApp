import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/models/joueur.dart';
import 'package:score_app/models/poste.dart';
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/screens/dialogEditJoueur.dart';

class JoueurList extends StatefulWidget {
  JoueurList({Key key}) : super(key: key);

  _JoueurListState createState() => _JoueurListState();
}

class _JoueurListState extends State<JoueurList> {
  List<Joueur> _joueurs;

  @override
  Widget build(BuildContext context) {
    if (this._joueurs == null) {
      final equipesP = Provider.of<EquipesProvider>(context);
      this._joueurs = equipesP.currentEquipe.joueurs;
    }
    return Container(
      color: Colors.white,
      child: _joueurs != null
          ? ListView(
              children: <Widget>[
                for (int i = 0; i < _joueurs.length; i++)
                  Container(
                    key: ValueKey(_joueurs[i].id),
                    width: double.infinity,
                    height: 125,
                    child: Stack(
                      children: <Widget>[
                        Card(
                          color: Color.fromRGBO(250, 250, 250, 1),
                          margin: EdgeInsets.symmetric(
                              horizontal: 45, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 6,
                          child: InkWell(
                            splashColor: _joueurs[i].estTitulaire
                                ? Colors.red
                                : Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                        return DialogEditJoueur(
                                            joueur: _joueurs[i]);
                                      },
                                      fullscreenDialog: true));
                            },
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  height: 125,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        _joueurs[i].prenom +
                                            " " +
                                            _joueurs[i].name,
                                        style: TextStyle(
                                            fontSize: 20, fontFamily: 'Serif'),
                                      ),
                                      Text(
                                        Poste.getPosteName(_joueurs[i].poste),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Verdana',
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 55,
                          left: 15,
                          child: Card(
                            elevation: 15,
                            color: _joueurs[i].estTitulaire
                                ? Colors.red
                                : Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      _joueurs[i].numero.toString(),
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Verdana',
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            )
          : null,
    );
  }
}
