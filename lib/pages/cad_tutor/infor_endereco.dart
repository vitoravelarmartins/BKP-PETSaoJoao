import 'package:flutter/material.dart';
import 'package:petsaojoao/components/comp_cad_tutor/text_label.dart';
import 'package:petsaojoao/components/comp_cad_tutor/sizebox.dart';
import 'package:petsaojoao/components/comp_cad_tutor/textfield.dart';

class info_endereco extends StatefulWidget {
  @override
  _info_enderecoState createState() => _info_enderecoState();
}

class _info_enderecoState extends State<info_endereco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        Container(
          color: Colors.blueAccent[200],
          child: Column(
            children: <Widget>[
              Center(child: conta_passos('2 de 3')),
              sizebox(30.0),
              Center(
                child: pergunta_form('Onde você mora?'),
              ),
              sizebox(50.0),
            ],
          ),
        ),
        sizebox(10.0),
        info_dados(),
        sizebox(20.0),
        sizebox(30.0),
        sizebox(20.0),
        sizebox(50.0),
        Container(
            padding: EdgeInsets.only(
              right: 15,
            ),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.keyboard_arrow_right),
            )),
      ]),
    );
  }
}
