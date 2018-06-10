import 'package:flutter_planets_tutorial/model/planets.dart';
import 'package:flutter_planets_tutorial/ui/home/home_page_contract.dart';

class HomePagePresenter {
  final HomePageView _view;

  HomePagePresenter(this._view);

  loadPlanets() {
    _view.showPlanets(planets);
  }
}