import 'package:flutter_planets_tutorial/model/planets.dart';
import 'package:flutter_planets_tutorial/ui/home/home_page_contract.dart';
import 'package:flutter_planets_tutorial/ui/home/home_page_presenter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  group('HomePagePresenter ', () {
    test('loads all the planets', () {
      final view = MockView();
      final presenter = HomePagePresenter(view);

      presenter.loadPlanets();

      verify(view.showPlanets(planets));
    });
  });
}

class MockView extends Mock implements HomePageView {}