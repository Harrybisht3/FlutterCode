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
                child: new Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: <Widget>[
                  SizedBox(child:  Container(
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://i.imgur.com/BoN9kdC.png")
                          )
                      )),height: 80.0,width: 80.0),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: <Widget>[ SizedBox(child:  Container(
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://i.imgur.com/BoN9kdC.png")
                          )
                      )),height: 30.0,width: 30.0), SizedBox(child:  Container(
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://i.imgur.com/BoN9kdC.png")
                          )
                      )),height: 30.0,width: 30.0)],)

                ],),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              new Column(children: _buildRow())
            ],
          ),
        ),
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/ic_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                    color: Colors.grey, shape: BoxShape.rectangle,border: Border.all(style: BorderStyle.solid)),
              child: new Row(
                children: <Widget>[
                  Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              image: new NetworkImage(
                                  "https://i.imgur.com/BoN9kdC.png")
                          )
                      )),
                  new Column(children: <Widget>[
                    new Text("Name of Student"),
                    Padding(padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),),
                    new Text('Class Name')
                  ],),

                ],
              ),),
      Expanded(child: new Container(
          child: new FutureBuilder<List<Post>>(
            future: NetworkUtil.fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildGridRow(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return Center(child: SizedBox(child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),height: 30.0
                  ,width: 30.0));
            },
          ))),

            ],
          ),
        ));
  }

  List<Widget> _buildRow() {
    List<Widget> drawerOptions = List<Widget>.generate(
        _list.length,
        (i) => ListTile(
            contentPadding: EdgeInsets.all(5.0),
            onTap: () => _onSelectItem(i),
            leading: new Container(
                width: 30.0,
                height: 30.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(_list[i].iconUrl)))),
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
