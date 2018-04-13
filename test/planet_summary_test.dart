import 'package:flutter/material.dart';
import 'package:flutter_planets_tutorial/model/planets.dart';
import 'package:flutter_planets_tutorial/ui/common/plannet_summary.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/finders.dart';

void main() {
  group('PlanetSummary ', () {
    testWidgets('should show all planet information in horizontal mode', (WidgetTester tester) async {
      final Planet planet = planets[0];
      await tester.pumpWidget(new MaterialApp(home: new PlanetSummary(planet)));

      expectSummaryToShow(planet);
    });

    testWidgets('should show all planet information in vertical mode', (WidgetTester tester) async {
      final Planet planet = planets[0];
      await tester.pumpWidget(new MaterialApp(home: new PlanetSummary.vertical(planet)));

      expectSummaryToShow(planet);
    });
  });
}

void expectSummaryToShow(Planet planet) {
  expect(find.text(planet.name), findsOneWidget);
  expect(find.text(planet.location), findsOneWidget);
  expect(find.text(planet.gravity), findsOneWidget);
  expect(find.text(planet.distance), findsOneWidget);
  expect(findAssetImage(planet.image), findsOneWidget);
}