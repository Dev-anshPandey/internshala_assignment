import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:internshala/screens/city.dart';
import 'package:internshala/screens/profile.dart';
import 'package:internshala/screens/search.dart';
import 'package:internshala/widgets/internship_card.dart';
import 'package:internshala/widgets/selected_city_constraints.dart';
import 'package:internshala/widgets/selected_constraints.dart';

class ConstraintsProvider extends ChangeNotifier {
  List<SelectedContraints> profileConstraints = [];
  List<SelectedCityContrainsts> cityConstraints = [];
  List<InternshipCard> internships = [];
  int counter = 0;

  int count() {
    counter = 0;
    for (var x in internships) {
      if ((profileConstraints.isNotEmpty
              ? profileConstraints.indexWhere(
                    (element) => element.name == x.title,
                  ) >=
                  0
              : true) &&
          (cityConstraints.isNotEmpty
              ? cityConstraints.indexWhere(
                    (element) => element.name == x.location,
                  ) >=
                  0
              : true) &&
          (duration != "none"
              ? int.parse(x.duration.substring(0, 1)) <= int.parse(duration)
              : true)) {
        counter++;
      }
    }
    return counter;
  }

  String duration = "none";
  void addProfile(SelectedContraints sc) {
    profileConstraints.add(sc);
    notifyListeners();
  }

  void removeProfile(int id) {
    profileConstraints.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearAllProfile() {
    profileConstraints.clear();
    notifyListeners();
  }

  void addCity(SelectedCityContrainsts scc) {
    cityConstraints.add(scc);
    notifyListeners();
  }

  void removeCity(int id, String city) {
    cityConstraints.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearAllCity() {
    cityConstraints.clear();
    notifyListeners();
  }

  void setDuration(String d) {
    duration = d;
    notifyListeners();
  }
}
