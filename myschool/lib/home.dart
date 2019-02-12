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
  List<Post>_list ;
  Future<List<Post>> post;
  @override
  void initState() {
    super.initState();
//    _list = List < Post>.generate(10,(i)=>Post());
  //  fetchPost();

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
                  child:new FutureBuilder<List<Post>>(future:NetworkUtil.fetchPost(),
                    builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildGridRow(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner
                    return CircularProgressIndicator();
                  },))
            ],
          ),
        ));
  }

/*  new Row(
  children: <Widget>[
  new Expanded(child:
  _buildGridRow())
  ],
  )*/

  Widget _buildRow(DrawerItem item) {
    return new GridTile(
      child: new Column(
        children: <Widget>[
          new CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: new Image.network(item.iconUrl)
          ),
          new Text(item.menuName,
            style: new TextStyle(color: Colors.black54, fontSize: 15.0),)
        ],
      ),
    );
  }

  Widget _buildGridRow(List<Post> post) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(2.0),
      childAspectRatio: 8.0 / 9.0,

      children: post.map(
            (Post) => RowDashBoard(post: Post),
      )
          .toList(),
    );
  }

}
