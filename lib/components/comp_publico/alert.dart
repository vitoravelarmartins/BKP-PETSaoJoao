import 'package:flutter/material.dart';

void alertaErro(context, icon, title, content) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Center(
                child: Column(children: [
              Icon(
                icon,
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
