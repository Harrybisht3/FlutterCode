import 'package:flutter/material.dart';
import 'package:myschool/navigator/navigator.dart';
import 'package:myschool/navigator/contants.dart';
import 'package:myschool/register.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldkey,
        backgroundColor: Colors.white,
        body: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/ic_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: new Stack(fit: StackFit.expand, children: <Widget>[
              new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    scaffoldBackgroundColor: Color.fromRGBO(125, 125, 125, 0.6),
                    inputDecorationTheme: new InputDecorationTheme(
                      // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                      labelStyle:
                          new TextStyle(color: Colors.black54, fontSize: 15.0),
                    )),
                isMaterialAppTheme: true,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: new Image.asset('images/ic_school.png',
                          width: 50.0, height: 50.0),
                    ),
                    new Container(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
                      child: new Form(
                        autovalidate: true,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new TextFormField(
                              style: TextStyle(color: Colors.grey),
                              decoration: new InputDecoration(
                                  labelText: "Enter Email",
                                  fillColor: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new TextFormField(
                              style: TextStyle(color: Colors.grey),
                              decoration: new InputDecoration(
                                labelText: "Enter Password",
                                fillColor: Colors.grey,
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                            ),
                            new MaterialButton(
                              height: 40.0,
                              minWidth: double.infinity,
                              color: Colors.green,
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: new Text(Constants.login_button),
                              onPressed: () {
                                MyNavigator.showToast(
                                    context, "Button Clicked", _scaffoldkey);
                              },
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            new MaterialButton(
                              height: 40.0,
                              minWidth: double.infinity,
                              color: Colors.blueAccent,
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child: new Text(Constants.register_button),
                              onPressed: () {
                                MyNavigator.goToRegister(context);
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ])));
  }
}
