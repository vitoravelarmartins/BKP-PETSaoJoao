import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/cad_tutor/cadastro_tutor.dart';
import 'package:petsaojoao/screens/cad_animal_encotrado/cadastro_animal_encontrado.dart';
import 'package:petsaojoao/screens/cad_meu_animal/cad_my_pet.dart';

//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

class dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueAccent[200],
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Center(
          child: ListView(children: <Widget>[
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cadastroTutor()),
                  );
                },
                child: Text("Ir Para Cadastro de Tutor")),
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cadastroAnimalEncontrado()),
                  );
                },
                child: Text("Cadastro Animal Econntrado ")),
            FlatButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegMyPet()),
                  );
                },
                child: Text("Cadastro  Meu Animal  ")),
          ]),
        ),
      ),
    );
  }
}
