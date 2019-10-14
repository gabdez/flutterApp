import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/widgets/equipeList.dart';
import 'package:score_app/widgets/myClipper.dart';

class SelectEquipe extends StatefulWidget {
  SelectEquipe({Key key}) : super(key: key);

  _SelectEquipeState createState() => _SelectEquipeState();
}

class _SelectEquipeState extends State<SelectEquipe> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void ajouterEquipe(String nomEquipe) {
    final equipesP = Provider.of<EquipesProvider>(context, listen: false);
    equipesP.addEquipe(nomEquipe);
    print(equipesP.items[equipesP.items.length - 1].id);
    print(equipesP.items[equipesP.items.length - 1].name);
  }

  void hideBottom() {
    myController.clear();
    Navigator.pop(context);
  }

  void showbottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(15.0),
            child: Container(
                child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: TextField(
                      controller: myController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Nom de l'équipe",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onPressed: () {
                      if (myController.text != '') {
                        ajouterEquipe(myController.text);
                        hideBottom();
                      }
                    },
                  )
                ],
              ),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print('build select equipe');
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.blueAccent,
              height: 175,
              child: Center(
                child: Text(
                  'Sélectionner votre équipe',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.white24,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: EquipeList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        heroTag: 'floatBtn',
        onPressed: () {
          showbottom();
        },
      ),
    );
  }
}
