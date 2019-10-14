import 'package:flutter/material.dart';
import 'package:score_app/widgets/joueurList.dart';
import 'dialogAddJoueur.dart';

class MonEquipe extends StatefulWidget {
  const MonEquipe({Key key}) : super(key: key);

  @override
  _MonEquipeState createState() => _MonEquipeState();
}

class _MonEquipeState extends State<MonEquipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          title: Text(
            'Mon équipe',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            color: Colors.blue,
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Container(
          color: Colors.white30,
          height: double.infinity,
          width: double.infinity,
          child: JoueurList()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        heroTag: 'floatBtnAddPlayer',
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
              builder: (BuildContext context) {
                return DialogAddJoueur();
              },
              fullscreenDialog: true));
        },
      ),
    );
  }
}
