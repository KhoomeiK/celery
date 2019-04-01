// IS THIS FILE STILL NEEDED???

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'food_icon.dart';
import 'stats_page.dart';
import "package:flutter/services.dart";
import 'globals.dart' as globals;
import 'analysis.dart';
import 'home_page.dart';
import 'Social.dart';
import 'package:celery/api.dart';

class AddItemPage extends StatefulWidget {
  State createState() => new AddItemPageState();
}

class AddItemPageState extends State<AddItemPage> {
  int index = 0;
  final formKey = new GlobalKey<FormState>();
  dynamic _borderRadius = new BorderRadius.circular(10.0);
  String newItem;
  String ingredient;
  bool repeat = false;

  List<String> ingredients = [];

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
                labelText: "Name of the dish",
                border: OutlineInputBorder(borderRadius: _borderRadius)),
            validator: (val) => (val == null) ? 'Empty' : null,
            onSaved: (val) => newItem = val,
          ),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          TextFormField(
            decoration: new InputDecoration(
                labelText: "Ingredient",
                border: OutlineInputBorder(borderRadius: _borderRadius)),
            validator: (val) => (val == null) ? 'Empty' : null,
            onSaved: (val) => ingredient = val,
          ),
        ],
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _showSnackBar();
      postIngredients("multi", newItem, ingredients);
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
    return Column(
      children: <Widget>[
        CupertinoButton(
          padding: EdgeInsets.all(20.0),
          //elevation: 0.0,
          child: Text("Add",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand",
                  color: Colors.white,
                  fontSize: 20.0)),
          //shape: RoundedRectangleBorder(borderRadius: _borderRadius),
          onPressed: () {
            setState(() {
              final form = formKey.currentState;
              form.save();
              print(ingredient);
              ingredients.add(ingredient);
            });
          },
          color: Colors.green,
          //splashColor: Colors.blue,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        CupertinoButton(
          padding: EdgeInsets.all(20.0),
          //elevation: 0.0,
          child: Text("Confirm",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand",
                  color: Colors.white,
                  fontSize: 20.0)),
          //shape: RoundedRectangleBorder(borderRadius: _borderRadius),
          onPressed: () {
            _submit();
          },
          color: Colors.green,
          //splashColor: Colors.blue,
        ),
      ],
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
            child: new Text("Add Item",
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
            SizedBox(height: 28.0),
            Expanded(
                child: new ListView.builder(
                    itemCount: ingredients.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Column(
                        children: <Widget>[
                          new Text(ingredients[index],
                              style: new TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Rajdhani",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.0)),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10.0)),
                          Divider(
                            height: 1.5,
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10.0)),
                        ],
                      );
                    })),
            _buildButton(),
            // _buildButton2(),
          ],
        ),
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }
}
