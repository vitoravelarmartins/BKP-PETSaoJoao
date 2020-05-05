import 'package:flutter/material.dart';

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
<<<<<<< HEAD:lib/pages/cad_meu_animal/cad_my_pet.dart
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
=======
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
>>>>>>> CorrigindoNomeDasClasses:lib/pages/cad_meu_animal/cad_meu_animal.dart
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
