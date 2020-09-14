import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_app/models/equipe.dart';
import 'package:score_app/models/match.dart' as m;
import 'package:score_app/providers/equipes_provider.dart';
import 'package:score_app/providers/matchs_provider.dart';
import 'package:score_app/widgets/matchCard.dart';

class LancerMatch extends StatefulWidget {
  const LancerMatch({Key key}) : super(key: key);

  @override
  _LancerMatchState createState() => _LancerMatchState();
}

class _LancerMatchState extends State<LancerMatch> {
  int _currentStep = 0;
  bool complete = false;
  List<m.Match> listMatch = [];
  MatchsProvider matchP;
  EquipesProvider equipesP;

  @override
  void initState() {
    super.initState();
  }

  next() {
    _currentStep + 1 != 2
        ? goTo(_currentStep + 1)
        : setState(() => complete = true);
  }

  goTo(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
      setState(() => complete = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    equipesP = Provider.of<EquipesProvider>(context, listen: false);
    Equipe equipe = equipesP.currentEquipe;
    matchP = Provider.of<MatchsProvider>(context, listen: false);
    listMatch = matchP.getListeMatchAVenir(equipe.id);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          title: Text(
            'Préparation d\'avant match',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
        body: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: _currentStep,
              onStepContinue: next,
              onStepCancel: cancel,
              onStepTapped: null,
              steps: [
                Step(
                  title: Text('équipe adverse'),
                  state: _currentStep == 0
                      ? StepState.indexed
                      : StepState.complete,
                  isActive: _currentStep == 0,
                  content: Flex(direction: Axis.vertical, children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: listMatch.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return MatchCard(listMatch[index]);
                          }),
                    ),
                  ]),
                ),
                Step(
                    title: Text('5 majeurs'),
                    isActive: _currentStep == 1,
                    content: Container(
                      height: MediaQuery.of(context).size.height - 300,
                      child: Text('step2'),
                    )),
              ],
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        _currentStep == 0
                            ? FlatButton.icon(
                                icon: Icon(Icons.exit_to_app),
                                label: const Text('Retour menu'),
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                              )
                            : FlatButton.icon(
                                icon: Icon(Icons.arrow_back_ios),
                                label: const Text('Précédent'),
                                onPressed: onStepCancel,
                              ),
                        _currentStep == 1 // this is the last step
                            ? RaisedButton.icon(
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  print('match lancer');
                                },
                                label: Text(
                                  'LANCER LE MATCH',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.blueAccent,
                              )
                            : RaisedButton.icon(
                                icon: Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                ),
                                onPressed: onStepContinue,
                                label: Text('Suivant',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                color: Colors.blueAccent,
                              ),
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
