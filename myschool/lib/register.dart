import 'package:flutter/material.dart';
import 'package:myschool/navigator/contants.dart';

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
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Theme(
              data: new ThemeData(
                  brightness: Brightness.dark,
                  inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                          color: Colors.tealAccent, fontSize: 18.0))),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 56.0),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.school,
                      color: Colors.greenAccent,
                      size: 25.0,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Form(
                        autovalidate: true,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new DropdownButton<String>(
                              isExpanded: true,
                              style: TextStyle(
                                  color: Colors.black),
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              items: _listSchools.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: selectedValue,
                                  child: new Text(value,
                                      style: TextStyle(
                                          color: Colors.red)),
                                );
                              }).toList(),
                              value: selectedValue,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 10.0),
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
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            new TextFormField(
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              decoration: new InputDecoration(
                                  labelText: Constants.enterUserEmail,
                                  fillColor: Colors.white),
                              keyboardType: TextInputType.text,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 10.0),
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
                          ],
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
