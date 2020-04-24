import 'package:flutter/material.dart';

import 'package:petsaojoao/components/comp_cad_meu_animal/camera_info.dart';
import 'package:petsaojoao/pages/cad_meu_animal/tirar_segunda_foto.dart';

class InstrucaoOutrasFoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 350,
                child: Text(
                  'Agora, sinta-se livre para tirar mais duas fotos de seu pet!',
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
                final camera = await getCameraInfo();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TirarSegundaFoto(
                      camera: camera,
                    ),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: (Text('Certo!')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
