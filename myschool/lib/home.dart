import 'package:flutter/material.dart';
import 'package:myschool/navigator/contants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text(Constants.dashboard)),
        drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new DrawerHeader(
                child: new Text(
                  Constants.wt1,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/ic_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Container(
                width: double.infinity,
                height: 200.0,
                padding: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  image: AssetImage(""),
                )),
                child: new Row(
                  children: <Widget>[
                    new Expanded(child: ListView.builder(itemBuilder: (context,position){
                      return Column(

                      );

                    }))
                  ],
                )
              )
            ],
          ),
        ));
  }
}
