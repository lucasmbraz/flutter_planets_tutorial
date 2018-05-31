import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_planets_tutorial/model/planets.dart';
import 'package:flutter_planets_tutorial/ui/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../util/mock_http_client.dart';

void main() {
  group('Home Page ', () {
    testWidgets('shows all the planets', (WidgetTester tester) async {
      await tester.pumpWidget(new MaterialApp(home: new HomePage()));

      for (Planet planet in planets.sublist(0, 3)) {
        expect(find.text(planet.name), findsOneWidget);
      }
      await tester.drag(find.byType(CustomScrollView), new Offset(0.0, -312.0));
      await tester.pump();
      expect(find.text(planets[4].name), findsOneWidget);
    });

    testWidgets('goes to detail page when tapping a planet', (WidgetTester tester) async {
      HttpOverrides.global = TestHttpOverrides();
      await tester.pumpWidget(new MaterialApp(home: new HomePage()));

      await tester.tap(find.text(planets[0].name));
      await tester.pumpAndSettle();

      expect(find.text("OVERVIEW"), findsOneWidget);
    });
  });
}