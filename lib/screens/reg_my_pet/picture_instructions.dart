import 'package:flutter/material.dart';

<<<<<<< HEAD:lib/screens/reg_my_pet/picture_instructions.dart
import 'package:petsaojoao/components/comp_reg_my_pet/camera_info.dart';
import 'package:petsaojoao/screens/reg_my_pet/take_first_picture.dart';
=======
import 'package:petsaojoao/components/my_pet/camera_info.dart';
import 'package:petsaojoao/screens/cad_meu_animal/take_first_picture.dart';
>>>>>>> f8af7b1fb20d0131f7d230b62fef66564c801724:lib/screens/cad_meu_animal/picture_instructions.dart

class PicInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: ListView(
          children: <Widget>[
            Container(
                child: Image.asset('assets/cad_animal/cachorro_lateral.png')),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 350,
                child: Text(
                  'Por favor, tente tirar uma foto de perfil igual a imagem acima...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
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
                final camera = await getCameraInfo();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakeFirstPic(
                      camera: camera,
                    ),
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
