//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:petsaojoao/pages/cad_tutor/info_pessoal.dart';

class cadastro_tutor extends StatefulWidget {
  @override
  _cadastro_tutorState createState() => _cadastro_tutorState();
}

class _cadastro_tutorState extends State<cadastro_tutor> {
  void navigationToNextPage() {
    //Navigator.push(context, _createRoute());
    Navigator.pushReplacement(context, _createRoute());
  }

  startCadTutorTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startCadTutorTimer();
  }

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
                  'Ops, não temos seus dados ainda 😥😿',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
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
    pageBuilder: (context, animation, secondaryAnimation) => Info_pessoal(),
    transitionDuration: const Duration(milliseconds: 500),
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
