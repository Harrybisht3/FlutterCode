import 'package:flutter/material.dart';
import 'package:myschool/model/postdata.dart';

class RowDashBoard extends StatelessWidget {
  final Post post;

  const RowDashBoard({this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
      child: SizedBox(
        height: 50.0,
        width: 150.0,
        child: Card(
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
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 20,
                child: Image.network(
                 "http://lorempixel.com/400/200/",
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
              Text(
                post.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFFD73C29),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
