import 'package:flutter/material.dart';

void alertaDoc(context, title, content) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Center(
                child: Column(children: [
              Icon(
                Icons.picture_in_picture,
                size: 30,
                color: Colors.red[900],
              ),
              Text(title),
            ])),
            content: Text(
              content,
              style: TextStyle(color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          ),
      barrierDismissible: true);
}

void alertaCEP(context, title, content) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Center(
                child: Column(children: [
              Icon(
                Icons.place,
                size: 30,
                color: Colors.red[900],
              ),
              Text(
                title,
              ),
            ])),
            content: Text(
              content,
              style: TextStyle(color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          ),
      barrierDismissible: true);
}
