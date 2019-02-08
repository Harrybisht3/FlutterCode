import 'package:flutter/material.dart';
import 'package:myschool/login.dart';
import 'package:myschool/register.dart';
import 'splash.dart';
var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginPage(),
  "register": (BuildContext context) => RegisterPage(),
};

void main() => runApp(new MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));

