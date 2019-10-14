import 'package:score_app/enums/postes.dart';

class Poste {
  static String getPosteName(Postes numPoste) {
    switch (numPoste) {
      case Postes.meneur:
        return 'Meneur';
        break;
      case Postes.arriere:
        return 'Arrière';
        break;
      case Postes.ailier:
        return 'Ailier';
        break;
      case Postes.ailierFort:
        return 'Ailier fort';
        break;
      case Postes.pivot:
        return 'Pivot';
        break;
      default:
        return "Poste non assigné";
    }
  }

  static List<Postes> getPostes() {
    return <Postes>[
      Postes.meneur,
      Postes.arriere,
      Postes.ailier,
      Postes.ailierFort,
      Postes.pivot
    ];
  }
}
