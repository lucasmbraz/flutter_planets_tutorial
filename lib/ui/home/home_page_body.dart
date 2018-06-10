import 'package:flutter/material.dart';
import 'package:flutter_planets_tutorial/model/planets.dart';
import 'package:flutter_planets_tutorial/ui/common/plannet_summary.dart';
import 'package:flutter_planets_tutorial/ui/home/home_page_contract.dart';
import 'package:flutter_planets_tutorial/ui/home/home_page_presenter.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() {
    return new _HomePageBodyState();
  }
}

class _HomePageBodyState extends State<HomePageBody> implements HomePageView {

  HomePagePresenter _presenter;
  List<Planet> _planets;

  _HomePageBodyState() {
    _presenter = HomePagePresenter(this);
    _planets = const [];
  }

  @override
  void initState() {
    super.initState();
    _presenter.loadPlanets();
  }

  @override
  showPlanets(List<Planet> planets) {
    setState(() {
      _planets = planets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new PlanetSummary(_planets[index]),
                  childCount: _planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
