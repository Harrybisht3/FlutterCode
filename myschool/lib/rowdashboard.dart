import 'package:flutter/material.dart';
import 'package:myschool/model/postdata.dart';

class RowDashBoard extends StatelessWidget {
  final Post post;

  const RowDashBoard({this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0)),
              Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://i.imgur.com/BoN9kdC.png")
                      )
                  )),

              Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
              Text(
                post.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFFD73C29),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
    );
  }
}
