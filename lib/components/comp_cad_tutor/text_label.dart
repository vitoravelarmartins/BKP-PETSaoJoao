import 'package:flutter/material.dart';

Widget conta_passos(text) {
  return Text(
    text,
    style: TextStyle(fontSize: 20, color: Colors.white),
  );
}

Widget pergunta_form(text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 25, color: Colors.white),
  );
}

Widget info_dados() {
  return Container(
    padding: EdgeInsets.only(
      left: 15,
    ),
    child: Row(children: <Widget>[
      Container(
        height: 30,
        width: 270,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.info,
                color: Colors.green,
              ),
              Text("Seus dados não serão divulgados"),
            ]),
      )
    ]),
  );
}
