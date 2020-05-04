import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/components/comp_cad_meu_animal/confirmation_buttons.dart';

class TelaConfirmacao extends StatefulWidget {
  final String image1;
  final String image2;
  final String image3;
  final Widget nextPage;

  TelaConfirmacao(
      {Key key, this.image1, this.image2, this.image3, this.nextPage})
      : super(key: key);

  @override
  _TelaConfirmacaoState createState() => _TelaConfirmacaoState();
}

class _TelaConfirmacaoState extends State<TelaConfirmacao> {
  @override
  // TODO: implement widget
  TelaConfirmacao get widget => super.widget;

  @override
  Widget build(BuildContext context) {

    AssetImage imagemMostra = AssetImage(widget.image1);

    void trocarimagem(String nextImage) {
      print('aaaa');
      setState(() {
        imagemMostra = new AssetImage(nextImage);
      });
      print(imagemMostra);
    }

    String image1 = widget.image1;
    String image2 = widget.image2;
    String image3 = widget.image3;
    final buttonWidth = MediaQuery.of(context).size.width / 4;
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: new BoxDecoration(
                image:
                    new DecorationImage(image: imagemMostra, fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: buttonWidth,
                    child: RaisedButton(
                      onPressed: () {
                        trocarimagem(image1);
                      },
                      child: Container(child: Image.file(File(image1))),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: buttonWidth,
                    child: RaisedButton(
                      onPressed: () {
                        trocarimagem(image2);
                      },
                      child: Container(child: Image.file(File(image2))),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: buttonWidth,
                    child: RaisedButton(
                      onPressed: () {
                        trocarimagem(image3);
                      },
                      child: Container(child: Image.file(File(image3))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
