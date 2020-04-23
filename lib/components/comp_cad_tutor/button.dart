import 'package:flutter/material.dart';

Widget confirmForm(funcao) {
  return Container(
      padding: EdgeInsets.only(
        right: 15,
      ),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
          funcao;
        },
        child: Icon(Icons.keyboard_arrow_right),
      ));
}
