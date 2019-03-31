// IS THIS FILE STILL NEEDED???

import 'package:flutter/material.dart';
import 'food_icon.dart';
import 'stats_page.dart';
import "package:flutter/services.dart";
import 'globals.dart' as globals;
import 'analysis.dart';
import 'home_page.dart';
import 'Social.dart';

class AddItemPage extends StatefulWidget {
  State createState() => new AddItemPageState();
}

class AddItemPageState extends State<AddItemPage> {
  int index = 0;
  final formKey = new GlobalKey<FormState>();
  dynamic _borderRadius = new BorderRadius.circular(10.0);
  String newItem;
  bool repeat = false;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          TextFormField(
            decoration: new InputDecoration(
                labelText: "Menu Item",
                border: OutlineInputBorder(borderRadius: _borderRadius)),
            validator: (val) => (val == null) ? 'Empty' : null,
            onSaved: (val) => newItem = val,
          ),
        ],
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      for (int i = 0; i < globals.global.length; i++) {
        if (globals.global[i].name == newItem) {
          repeat = true;
          _showSnackBar2();
        }
      }
      if (!repeat) {
        globals.global.add(new Food_icon(newItem, "", "", 0.0, []));
        _showSnackBar();
      }
    }
  }

  void _showSnackBar() {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text("Successfully Added!"),
    ));
  }

  void _showSnackBar2() {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text("Already Added!"),
    ));
  }

  Widget _buildBottomNav() {
    return new BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        this.index = index;

        if (index == 0) {
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
              Image.asset('assets/Logo.png', width: 70.0, height: 70.0),
              SizedBox(width: 25.0),
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
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Stats1Page()));
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

  Widget _buildButton() {
    return RaisedButton(
      padding: EdgeInsets.all(20.0),
      elevation: 0.0,
      child: Text("GO",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Rajdhani",
              color: Colors.white,
              fontSize: 25.0)),
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      onPressed: () {
        _submit();
      },
      color: Colors.lightBlue,
      splashColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    //showMap();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return new Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
        title: new Padding(
            child: new Text("Recents",
                style: new TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Rajdhani",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0)),
            padding: const EdgeInsets.only(left: 0.0)),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 9.0),
            _buildForm(),
            SizedBox(height: 9.0),
            SizedBox(height: 19.0),
            _buildButton(),
            // _buildButton2(),
            Flex(
              direction: Axis.vertical,
              children: <Widget>[],
            )
          ],
        ),
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }
}
