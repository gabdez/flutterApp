import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/enums/postes.dart';
import 'package:score_app/models/joueur.dart';
import 'package:score_app/models/poste.dart';
import 'package:score_app/providers/equipes_provider.dart';

class DialogAddJoueur extends StatefulWidget {
  @override
  DialogAddJoueurState createState() => DialogAddJoueurState();
}

class DialogAddJoueurState extends State<DialogAddJoueur> {
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final numeroController = TextEditingController();

  List<Postes> _postes = Poste.getPostes();
  List<DropdownMenuItem<Postes>> _dropdownMenuItems;
  Postes _selectedPoste;

  bool _estTitulaire = false;

  void _onChanged(bool value) => setState(() => _estTitulaire = value);

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_postes);
    _selectedPoste = _dropdownMenuItems[0].value;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nomController.dispose();
    prenomController.dispose();
    numeroController.dispose();
    super.dispose();
  }
  // for dropdown //

  List<DropdownMenuItem<Postes>> buildDropdownMenuItems(List postes) {
    List<DropdownMenuItem<Postes>> items = List();
    for (Postes poste in postes) {
      items.add(
        DropdownMenuItem(
          value: poste,
          child: Text(Poste.getPosteName(poste)),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Postes selectedPoste) {
    setState(() {
      _selectedPoste = selectedPoste;
    });
  }

  // for dropdown //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Nouveau joueur',
            style: TextStyle(color: Colors.blue),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.blue,
            ),
            color: Colors.blue,
            onPressed: () => Navigator.pop(context),
          )),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: prenomController,
                decoration: InputDecoration(
                    labelText: 'Prénom',
                    border: UnderlineInputBorder(),
                    filled: true),
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: nomController,
                decoration: InputDecoration(
                    labelText: 'Nom',
                    border: UnderlineInputBorder(),
                    filled: true),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: numeroController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Numéro de maillot',
                    border: UnderlineInputBorder(),
                    filled: true),
              ),
              SizedBox(
                height: 24,
              ),
              DropdownButton(
                value: _selectedPoste,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(
                height: 24,
              ),
              SwitchListTile(
                value: _estTitulaire,
                onChanged: _onChanged,
                title: Text(
                  _estTitulaire ? "Titulaire" : 'Remplaçant',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blueAccent,
                      onPressed: canCreate()
                          ? () {
                              ajouterJoueur();
                            }
                          : null,
                      child: Text(
                        "Créer joueur",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void ajouterJoueur() {
    final equipesP = Provider.of<EquipesProvider>(context);
    final equipe = equipesP.currentEquipe;
    equipesP.addJoueur(
        equipe,
        Joueur(
            id: equipesP.currentEquipe.joueurs.length + 1,
            name: nomController.text,
            prenom: prenomController.text,
            numero: int.parse(numeroController.text),
            poste: _selectedPoste,
            estTitulaire: _estTitulaire));
    Navigator.pop(context);
  }

  bool canCreate() {
    return nomController.text != '' &&
        prenomController.text != '' &&
        numeroController.text != '';
  }
}
