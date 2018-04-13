import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_planets_tutorial/model/planets.dart';
import 'package:flutter_planets_tutorial/ui/detail/detail_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/finders.dart';
import 'util/mock_http_client.dart';

void main() {
  group('DetailPage ', () {
    testWidgets('should show all details of the planet', (WidgetTester tester) async {
      HttpOverrides.global = TestHttpOverrides();
      Planet planet = planets.first;
      await tester.pumpWidget(new MaterialApp(home: new DetailPage(planet)));

      expect(find.text(planet.name), findsOneWidget);
      expect(find.text(planet.location), findsOneWidget);
      expect(find.text(planet.gravity), findsOneWidget);
      expect(find.text(planet.distance), findsOneWidget);
      expect(find.text(planet.description), findsOneWidget);
      expect(findAssetImage(planet.image), findsOneWidget);
      expect(findNetworkImage(planet.picture), findsOneWidget);
    });
  });
}