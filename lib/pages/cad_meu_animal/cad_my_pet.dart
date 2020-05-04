//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/comp_publico/sizebox.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'info_meu_animal.dart';

class CadastroAnimal extends StatefulWidget {
  @override
  _CadastroAnimalState createState() => _CadastroAnimalState();
}

import 'package:petsaojoao/pages/cad_meu_animal/picture_instructions.dart';

class RegMyPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blueAccent[200],
          body: ListView(children: <Widget>[
            Container(child: Image.asset('assets/background/superior.png')),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 350,
                child: Text(
                  'Vamos Cadastrar seu Pet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.lightGreenAccent,
              textColor: Colors.black,
              disabledColor: Colors.green,
              disabledTextColor: Colors.grey,
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PicInstructions(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Transform.rotate(
                    angle: -80,
                    child: GlowingProgressIndicator(
                      duration: Duration(milliseconds: 1000),
                      child: Icon(
                        FontAwesomeIcons.paw,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Transform.rotate(
                    angle: -80,
                    child: GlowingProgressIndicator(
                      duration: Duration(milliseconds: 1550),
                      child: Icon(
                        FontAwesomeIcons.paw,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(child: Image.asset('assets/background/inferior.png')),
          ])),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => InfoMeuAnimal(),
    transitionDuration: const Duration(milliseconds: 1800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
