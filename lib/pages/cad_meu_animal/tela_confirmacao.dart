import 'dart:io';
import 'package:flutter/material.dart';
import 'package:petsaojoao/components/comp_cad_meu_animal/confirmation_buttons.dart';

class TelaConfirmacao extends StatelessWidget {
  final String imagePath;
  final Widget nextPage;

  const TelaConfirmacao({Key key, this.imagePath, this.nextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(child: Image.file(File(imagePath))),
          confirmationButtons(context, imagePath, nextPage)
        ],
      ),
      backgroundColor: Colors.black,
    ));
  }
}
