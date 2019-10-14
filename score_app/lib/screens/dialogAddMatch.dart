import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DialogAddMatch extends StatefulWidget {
  @override
  DialogAddMatchState createState() => DialogAddMatchState();
}

class DialogAddMatchState extends State<DialogAddMatch> {
  final nomEquipeAdvController = TextEditingController();
  DateTime gameDate = DateTime.now();

  bool _estDomicile = true;

  void _onChanged(bool value) => setState(() => _estDomicile = value);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nomEquipeAdvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Ajouter match',
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
        height: double.infinity,
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: nomEquipeAdvController,
                  decoration: InputDecoration(
                      labelText: 'Nom de l\'équipe adverse',
                      border: UnderlineInputBorder(),
                      filled: true),
                ),
                SizedBox(
                  height: 24,
                ),
                SwitchListTile(
                  value: _estDomicile,
                  onChanged: _onChanged,
                  title: Text(
                    "Match à " + (_estDomicile ? "domicile" : 'l\'extérieur'),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                FlatButton.icon(
                  label: Text(formatDate(gameDate, [
                    dd,
                    '-',
                    mm,
                    '-',
                    yyyy,
                  ])),
                  icon: Icon(
                    Icons.calendar_today,
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: gameDate,
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.light(),
                          child: child,
                        );
                      },
                    ).then((onValue) => {
                          if (onValue != null)
                            setState(() {
                              gameDate = onValue;
                            })
                        });
                  },
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
                                ajouterMatch();
                              }
                            : null,
                        child: Text(
                          "Créer nouveau match",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  void ajouterMatch() {
    Navigator.pop(
        context, [nomEquipeAdvController.text, _estDomicile, gameDate]);
  }

  bool canCreate() {
    return nomEquipeAdvController.text != '';
  }
}
