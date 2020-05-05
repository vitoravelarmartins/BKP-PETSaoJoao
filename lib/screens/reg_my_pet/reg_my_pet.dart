import 'package:flutter/material.dart';

import 'package:petsaojoao/screens/reg_my_pet/picture_instructions.dart';

class RegMyPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: ListView(
          children: <Widget>[
            Container(child: Image.asset('assets/background/superior.png')),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 350,
                child: Text(
                  'Que tal cadastrar seu pet?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
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
                );
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: (Text('Vamos Lá!')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
