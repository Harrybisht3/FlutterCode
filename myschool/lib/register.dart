import 'package:flutter/material.dart';
import 'package:myschool/navigator/contants.dart';
import 'package:myschool/navigator/navigator.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> _listSchools;
  List<String> _userType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listSchools = [Constants.select_school, 'A', 'B', 'C', 'D'];
    _userType = [
      Constants.select_userType,
      'Student',
      'Parent',
      'Teacher',
      'Principal'
    ];
  }

  @override
  Widget build(BuildContext context) {
    String selectedValue;
    // TODO: implement build
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: AssetImage("images/ic_background.png"),
            fit: BoxFit.cover,
          )),
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.black54, fontSize: 15.0))),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(top: 56.0),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25.0,
                        child: Icon(
                          Icons.school,
                          color: Colors.greenAccent,
                          size: 25.0,
                        ),
                      ),
                      new Container(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        child: new Form(
                            autovalidate: true,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new DropdownButton<String>(
                                  isExpanded: true,
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      selectedValue = newValue;
                                    });
                                  },
                                  items: _listSchools.map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: selectedValue,
                                      child: new Text(value,
                                          style: TextStyle(color: Colors.red)),
                                    );
                                  }).toList(),
                                  value: selectedValue,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                ),
                                new TextFormField(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  decoration: new InputDecoration(
                                      labelText: Constants.enterUserId,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.text,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                ),
                                new TextFormField(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  decoration: new InputDecoration(
                                      labelText: Constants.enterUserEmail,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                ),
                                new TextFormField(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  decoration: new InputDecoration(
                                      labelText: Constants.enter_phonenumber,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.phone,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                ),
                                new TextFormField(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  decoration: new InputDecoration(
                                      labelText: Constants.enter_password,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                ),
                                new TextFormField(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  decoration: new InputDecoration(
                                      labelText: Constants.confirm_password,
                                      fillColor: Colors.white),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                ),
                                new MaterialButton(
                                  height: 35.0,
                                  minWidth: double.infinity,
                                  color: Colors.blueAccent,
                                  splashColor: Colors.teal,
                                  textColor: Colors.white,
                                  child: new Text(Constants.register_submit),
                                  onPressed: () {
                                    MyNavigator.goToHome(context);
                                  },
                                )
                              ],
                            )),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
