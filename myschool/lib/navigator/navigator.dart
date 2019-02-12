import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myschool/home.dart';
import 'package:myschool/register.dart';

class MyNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
    //  finishCurrentScreen(context);
  }

  static void goToRegister(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (context) => new RegisterPage()));

  }

  static void goToHome(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(
            builder: (context) => new HomePage()));

  }

  static void finishCurrentScreen(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }

  static void showToast(BuildContext context, String value,GlobalKey<ScaffoldState>  key) {
    final snackBar = SnackBar(
      content: Text(value),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
 //   Scaffold.of(context).showSnackBar(snackBar);
    key.currentState.showSnackBar(snackBar);
  }
}
