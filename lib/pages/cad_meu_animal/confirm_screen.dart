import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {
  final String image1;
  final String image2;
  final String image3;
  final Widget nextPage;

  ConfirmScreen({Key key, this.image1, this.image2, this.image3, this.nextPage})
      : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  // TODO: implement widget
  ConfirmScreen get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    AssetImage showImage = AssetImage(widget.image1);

    void imageSwap(String nextImage) {
      print('aaaa');
      setState(
        () {
          showImage = new AssetImage(nextImage);
        },
      );
      print(showImage);
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
                image: new DecorationImage(image: showImage, fit: BoxFit.cover),
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
                        imageSwap(image1);
                      },
                      child: Container(child: Image.file(File(image1))),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: buttonWidth,
                    child: RaisedButton(
                      onPressed: () {
                        imageSwap(image2);
                      },
                      child: Container(child: Image.file(File(image2))),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: buttonWidth,
                    child: RaisedButton(
                      onPressed: () {
                        imageSwap(image3);
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
