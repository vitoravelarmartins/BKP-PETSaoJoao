import 'dart:io';
import 'package:flutter/material.dart';

Widget confirmationButtons(context, String imagePath, Widget nextPage) {
  var screenSize = MediaQuery.of(context).size;
  var widthDivision = (screenSize.width / 5);
  var heightDivision = (screenSize.height / 15);

  return ButtonBar(
    alignment: MainAxisAlignment.center,
    children: <Widget>[
      FlatButton(
        color: Colors.red,
        textColor: Colors.black,
        disabledColor: Colors.redAccent,
        disabledTextColor: Colors.grey,
        onPressed: () async {
          File(imagePath).deleteSync(recursive: true);
          PaintingBinding.instance.imageCache.clear();
          Navigator.pop(context);
        },
        child: Container(
          width: widthDivision,
          height: heightDivision,
          alignment: Alignment.center,
          child: (SizedBox(
            child: Icon(Icons.thumb_down),
          )),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: widthDivision, bottom: 0, top: 0, right: widthDivision),
      ),
      FlatButton(
        color: Colors.lightGreenAccent,
        textColor: Colors.black,
        disabledColor: Colors.green,
        disabledTextColor: Colors.grey,
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        child: Container(
          width: widthDivision,
          height: heightDivision,
          alignment: Alignment.center,
          child: (SizedBox(
            child: Icon(Icons.thumb_up),
          )),
        ),
      )
    ],
  );
}
