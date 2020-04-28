import 'package:flutter/material.dart';

import 'package:petsaojoao/components/comp_cad_meu_animal/send_to_server.dart';

class FimCadAnimal extends StatelessWidget {
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
                  'Finalizar Cadastro?',
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
                final resposta = await sendToServer();
                if (resposta == 'complete') {}
              },
              child: Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: (Text('Enviar')),
              ),
            ),
            Container(child: Image.asset('assets/background/inferior.png')),
          ],
        ),
      ),
    );
  }
}
