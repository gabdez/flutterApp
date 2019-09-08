import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/screens/home.dart';
import 'package:score_app/transitions/SlideRightRoute.dart';

class EquipeList extends StatelessWidget {
  Widget _buildProductItem(
    BuildContext context,
    int index,
  ) {
    final equipesP = Provider.of<EquipesProvider>(context);
    final equipes = equipesP.items;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          onTap: () {
            equipesP.currentEquipe = equipes[index];
            Navigator.push(
              context,
              SlideRightRoute(page: Home(), duration: 200),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(equipes[index].name,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                  )),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build equipe list');
    final equipesP = Provider.of<EquipesProvider>(context);
    final equipes = equipesP.items;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: _buildProductItem,
      itemCount: equipes.length,
    );
  }
}
