// IS THIS FILE STILL NEEDED???

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'food_icon.dart';
import 'package:transparent_image/transparent_image.dart';
import 'recents.dart';
import 'stats_page.dart';
import 'globals.dart' as globals;
import 'analysis.dart';
import 'Social.dart';
import 'add_item.dart';

class HomePage extends StatefulWidget {
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;
  List<Food_icon> list = globals.global;
  Widget _buildBottomNav() {
    return new BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        this.index = index;
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
              Image.asset('assets/Logo.png', width: 70.0, height: 70.0),
              SizedBox(width: 40.0),
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
            title: Text("---", style: TextStyle(fontFamily: "Rajdhani")),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Stats2Page()));
            }),
        ListTile(
            title: Text("---", style: TextStyle(fontFamily: "Rajdhani")),
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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return new Scaffold(
      appBar: AppBar(
        title: new Padding(
            child: new Text("Menu",
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Rajdhani",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0)),
            padding: const EdgeInsets.only(left: 0.0)),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (_) => new AddItemPage(),
                    ),
                  );
                },
                child: Icon(Icons.add),
              )),
          SizedBox(width: 17.0),
        ],
      ),
      body: PageView(
        children: <Widget>[
          new CustomScrollView(
            primary: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.all(15.0),
                sliver: new SliverFixedExtentList(
                    itemExtent: 200.0,
                    delegate: SliverChildListDelegate(
                      listFoods(list, context),
                    )),
              ),
            ],
          ),
        ],
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  List<Widget> listFoods(List<Food_icon> food, BuildContext context) {
    // Children list for the list.
    List<Widget> listElementWidgetList = new List<Widget>();
    if (food != null) {
      var lengthOfList = list.length;
      for (int i = 0; i < lengthOfList; i++) {
        Food_icon food = list[i];
        // Image URL
        var imageURL = food.imagePath;
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
                    globals.global_name = food.name;
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (_) => new StatsPage(),
                        ));
                  },
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(20.0),
                              child: new FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: imageURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          new ClipRRect(
                            borderRadius: new BorderRadius.circular(20.0),
                            child: new Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                  Colors.grey.withOpacity(0.0),
                                  //green = 0x802ecc71
                                  Color(0x802ecc71),
                                ],
                                        stops: [
                                  0.0,
                                  0.9
                                ]))),
                          )
                        ],
                      ),
                      new Padding(
                          padding: EdgeInsets.only(top: 129.0, left: 30),
                          child: Text(food.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27.0,
                                  fontFamily: "Quicksand",
                                  fontWeight: FontWeight.w500)))
                    ],
                  ))),
        ));

        listElementWidgetList.add(listItem);
      }
    }
    return listElementWidgetList;
  }
}
