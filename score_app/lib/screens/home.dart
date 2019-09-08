import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/widgets/homeGridList.dart';
import 'package:score_app/widgets/myClipper.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print('build home');
    final equipesP = Provider.of<EquipesProvider>(context);
    final equipe = equipesP.currentEquipe;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.blueAccent,
              height: 275,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30, top: 80),
                      child: Text(
                        equipe.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 175), child: HomeGridList()),
        ],
      ),
    );
  }
}
