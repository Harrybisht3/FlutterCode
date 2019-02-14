import 'package:flutter/material.dart';
import 'package:myschool/navigator/contants.dart';
import 'package:myschool/model/draweritem.dart';
import 'package:myschool/model/postdata.dart';
import 'package:myschool/service/services.dart';
import 'package:myschool/rowdashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DrawerItem> _list;

  Future<List<Post>> post;
  int _selectedDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
    _list = List <DrawerItem>.generate(5,(i)=>DrawerItem("Item $i","https://i.imgur.com/BoN9kdC.png"));

  }

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
              new Column(
                children: _buildRow()
              )
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
                  child: new FutureBuilder<List<Post>>(
                    future: NetworkUtil.fetchPost(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return _buildGridRow(snapshot.data);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner
                      return CircularProgressIndicator();
                    },
                  ))
            ],
          ),
        ));
  }


  List<Widget> _buildRow() {
    List<Widget> drawerOptions =List <Widget>.generate(_list.length,(i)=>ListTile(
    contentPadding: EdgeInsets.all(5.0),
     onTap: () => _onSelectItem(i),
    leading: new Container(
    width: 30.0,
    height: 30.0,
    decoration: new BoxDecoration(
    shape: BoxShape.circle,
    image: new DecorationImage(
    fit: BoxFit.fill,
    image: new NetworkImage(
   _list[i].iconUrl)
    )
    )),
    title: new Text(
    _list[i].menuName,
    style: new TextStyle(color: Colors.black54, fontSize: 15.0),
    )));
    return drawerOptions;
  }
  //Let's update the selectedDrawerItemIndex the close the drawer
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    //we close the drawer
    Navigator.of(context).pop();
  }


  Widget _buildGridRow(List<Post> post) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(2.0),
      childAspectRatio: 8.0 / 9.0,
      children: post
          .map(
            (Post) => RowDashBoard(post: Post),
          )
          .toList(),
    );
  }
}
