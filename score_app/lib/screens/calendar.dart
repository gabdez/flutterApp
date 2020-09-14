import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/models/equipe.dart';
import 'package:score_app/models/match.dart' as m;
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/providers/matchs_provider.dart';
import 'package:score_app/screens/dialogAddMatch.dart';
import 'package:score_app/widgets/carouselMatch.dart';
import 'package:score_app/widgets/listMatchJouer.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<m.Match> listMatchJoue = [];
  List<m.Match> listMatch = [];
  MatchsProvider matchP;
  EquipesProvider equipesP;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    equipesP = Provider.of<EquipesProvider>(context, listen: false);
    Equipe equipe = equipesP.currentEquipe;
    matchP = Provider.of<MatchsProvider>(context, listen: false);
    listMatch = matchP.getListeMatchAVenir(equipe.id);
    listMatchJoue = matchP.getListeMatchJoue(equipe.id);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          title: const Text(
            'Calendrier',
            style: TextStyle(fontSize: 25, color: Colors.blue),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            color: Colors.blue,
            onPressed: () => Navigator.pop(context, false),
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute<List<dynamic>>(
                  builder: (BuildContext context) {
                    return DialogAddMatch();
                  },
                  fullscreenDialog: true))
              .then((response) => {
                    if (response != null && response.length > 0)
                      matchP.addMatch(
                          equipesP.currentEquipe.id,
                          m.Match(
                              equipe: equipesP.currentEquipe,
                              nomEquipeAdv: response[0],
                              estDomicile: response[1],
                              date: response[2]))
                  });
        },
      ),
      body: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 40),
                  child: CarouselMatch("A venir", listMatch)),
              ListMatchJouer(listMatchJoue),
            ],
          )),
    );
  }
}
