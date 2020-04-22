import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/reg_my_pet/reg_my_pet.dart';
import 'package:petsaojoao/screens/animal_reg_found/animal_reg_found.dart';
import 'package:petsaojoao/screens/register_tutor/register_tutor.dart';

//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

class Dashboard extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => RegisterTutor()),
                  );
                },
                child: Text("Ir Para Cadastro de Tutor")),
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimalRegisterFound()),
                  );
                },
                child: Text("Cadastro Animal Econntrado ")),
            FlatButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
<<<<<<< HEAD
<<<<<<< HEAD:lib/pages/dashboard/dashboard.dart
                    MaterialPageRoute(
                        builder: (context) => RegMyPet()),
<<<<<<< HEAD
=======
                    MaterialPageRoute(builder: (context) => CadastroAnimal()),
>>>>>>> 4fe4a56... CorrigindoNomeDasClasses
=======
>>>>>>> 3cb4d88... add
=======
                    MaterialPageRoute(builder: (context) => RegMyPet()),
>>>>>>> 386f232... Alterar Pages p/ screens:lib/screens/dashboard/dashboard.dart
=======
                    MaterialPageRoute(builder: (context) => RegPet()),
>>>>>>> bc135e0... inico tradução
                  );
                },
                child: Text("Cadastro  Meu Animal  ")),
          ]),
        ),
      ),
    );
  }
}
