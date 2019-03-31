// IS THIS FILE STILL NEEDED???

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'recents.dart';
import 'globals.dart' as globals;
import 'home_page.dart';
import 'analysis.dart';
import 'chart.dart';
import "detail_graph.dart";
import "detail_stats_page.dart";
import 'Social.dart';
import 'package:celery/api.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DetailPage extends StatefulWidget {
  String name;
  String typeOfGraph;
  static String imageURL;
  static String rest;
  static double cost;
  static String foodName;
  List<String> ingredients;
  DetailPage(this.name, this.typeOfGraph);
  State createState() => new DetailPageState(name, typeOfGraph);
}

class DetailPageState extends State<DetailPage> {
  int index = 0;
  String name;
  String imageURL;
  String rest;
  double cost;
  String typeOfGraph;
  List<String> ingredients;

  DetailPageState(this.name, this.typeOfGraph);

  List<Widget> finalGraphs = new List<Widget>();

  Widget _buildBottomNav() {
    return new BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        this.index = index;
        if (index == 0) {
          globals.global_name = "";
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
        if (index == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AnalysisPage()));
        }
        if (index == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SocialPage()));
        }
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text("Home"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.trending_up),
          title: new Text("Statistics"),
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.people),
          title: new Text("Suppliers"),
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              Image.asset('assets/logo.png', width: 70.0, height: 70.0),
              SizedBox(width: 20.0),
              Text("Celery",
                  style: TextStyle(
                      fontFamily: "Rajdhani",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        ListTile(
            title: Text(
              "Recently Cooked",
              style: TextStyle(fontFamily: "Rajdhani"),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecentsPage()));
            }),
        ListTile(
            title: Text("Dishes", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats2Page()));
            }),
        ListTile(
            title: Text("Suppliers", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats3Page()));
            }),
        ListTile(
            title: Text("Settings", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats4Page()));
            }),
        ListTile(
            title: Text("Help", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats5Page()));
            }),
        ListTile(
            title: Text("About Us", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats6Page()));
            }),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    //showMap();
    print(this.name);
    print("from state");
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return new Scaffold(
      appBar: AppBar(
        title: new Padding(
            child: new Text("Statistics",
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Rajdhani",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0)),
            padding: const EdgeInsets.only(left: 0.0)),
      ),
      body: PageView(children: <Widget>[
        new FutureBuilder(
            future: getIngredients(this.name, this.typeOfGraph == "Profit" ? "profit" : "sust", "multi"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Ingredient> preProcessed = snapshot.data;
                List<LinearSales> list1 = [];
                for (int i = 0; i < preProcessed.length; i++) {
                  for (int j = 0; j <= 11; j++) {
                    list1.add(LinearSales(
                        j, preProcessed[i].data[j].toInt(), [8, 3, 2, 3], 2.0));
                  }
                  finalGraphs.add(listGraphs(list1,
                      this.typeOfGraph + ": " + preProcessed[i].ingredientName, context));
                  list1 = [];
                }
                return new CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    new SliverPadding(
                      padding: const EdgeInsets.all(15.0),
                      sliver: new SliverFixedExtentList(
                          itemExtent: 200.0,
                          delegate: SliverChildListDelegate(
                            finalGraphs,
                          )),
                    ),
                  ],
                );
              } else {
                return new Center(child: new CircularProgressIndicator());
              }
            }),
      ]),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget listGraphs(
      List<LinearSales> graphs, String type, BuildContext context) {
    final green = charts.MaterialPalette.green.makeShades(2);
    final red = charts.MaterialPalette.red.makeShades(2);
    if (graphs != null) {
      // Image URL
      //var imageURL = food.imagePath;
      // List item created with an image of the poster
      var listItem = Container(
          child: new Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: new GestureDetector(
                onTap: () {
                  //globals.global_name = graph.type;
                },
                child: Stack(children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(
                        top: 35, left: 15, right: 15, bottom: 10),
                    child: new SegmentsLineChart(
                      [
                        new charts.Series<LinearSales, int>(
                          id: 'Dash Pattern Change',
                          // Light shade for even years, dark shade for odd.
                          colorFn: (LinearSales sales, _) =>
                              (sales.year > 9 && graphs[10].sales > graphs[11].sales) ? red[0] : green[1],
                          dashPatternFn: (LinearSales sales, _) =>
                              sales.year <= 9 ? null : sales.dashPattern,
                          strokeWidthPxFn: (LinearSales sales, _) =>
                              sales.strokeWidthPx,
                          domainFn: (LinearSales sales, _) => sales.year,
                          measureFn: (LinearSales sales, _) => sales.sales,
                          data: graphs,
                        )
                      ].toList(),
                      animate: true,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 7),
                        child: Center(
                            child: Text(type,
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )
                ]))),
      ));
      return listItem;
    }
  }
}
