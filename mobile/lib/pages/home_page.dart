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
import 'package:celery/api.dart';

class HomePage extends StatefulWidget {
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;

  //Future<List<Food_icon>> list = getDishes("multi");

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
          icon: new Icon(Icons.lightbulb_outline),
          title: new Text("Insights"),
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
            child: new Center(
              child: new Text("Menu",
                  style: new TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Rajdhani",
                      fontStyle: FontStyle.normal,
                      fontSize: 25.0)),
            ),
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
          new FutureBuilder(
            future: getDishes("multi"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Food_icon> list = snapshot.data;
                return new CustomScrollView(
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
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: CircularProgressIndicator()
                );
              } else {
                return Center(
                  child: CircularProgressIndicator()
                );
              }
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  List<Widget> listFoods(List<Food_icon> foodList, BuildContext context) {
    // Children list for the list.
    List<Widget> listElementWidgetList = new List<Widget>();
    if (foodList != null) {
      var lengthOfList = foodList.length;
      for (int i = 0; i < lengthOfList; i++) {
        Food_icon food = foodList[i];
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
                    if (globals.recent.indexOf(food.name)==-1)
                    {
                      globals.recent.add(food.name);
                    }
                    print(food.name);
                    print("food above");
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (_) => new StatsPage(food.name),
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
                                image: imageURL == null ? "https://steamykitchen.com/wp-content/uploads/2017/10/vietnamese-chicken-pho-ga-3692-640x480.jpg" : imageURL,
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
                                  food.investIndex > 0.2 ? Color(0x802ecc71) : Colors.red,
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
