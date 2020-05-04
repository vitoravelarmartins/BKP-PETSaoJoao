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

Widget info_dados(context) {
  return Container(
    padding: EdgeInsets.only(
      left: 15,
    ),
    child: Row(children: <Widget>[
      FlatButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Center(
                          child: Column(children: [
                        Icon(
                          Icons.info,
                          size: 30,
                          color: Colors.green,
                        ),
                        Text("Importância dos dados "),
                      ])),
                      content: Text(
                        "Fique tranquilo, todos os seus dados estão protegidos e so poderam ser ultilizados pela prefeitura para registro do animal",
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
          },
          child: Container(
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
                  Text("Seus dadados não serão divulgados"),
                ]),
          ))
    ]),
  );
}
