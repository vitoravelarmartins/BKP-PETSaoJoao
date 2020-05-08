//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/comp_publico/sizebox.dart';
import 'package:petsaojoao/screens/register_tutor/personal_info.dart';
import 'package:progress_indicators/progress_indicators.dart';

class RegisterTutor extends StatefulWidget {
  @override
  _RegisterTutorState createState() => _RegisterTutorState();
}

class _RegisterTutorState extends State<RegisterTutor> {
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
                  'Ops, não temos seus dados ainda',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            sizebox(20.0),
            Center(
              child: CollectionSlideTransition(
                children: <Widget>[
                  Transform.rotate(
                    angle: -80,
                    child: GlowingProgressIndicator(
                      duration: Duration(milliseconds: 550),
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
    pageBuilder: (context, animation, secondaryAnimation) => PersonalInfo(),
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
