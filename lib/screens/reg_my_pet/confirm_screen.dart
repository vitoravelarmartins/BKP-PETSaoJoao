import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/orientation_organize.dart';

import 'package:petsaojoao/screens/reg_my_pet/end_reg_my_pet.dart';

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
    String image1 = widget.image1;
    String image2 = widget.image2;
    String image3 = widget.image3;
    String showImage = widget.image1;

    void _imageSwap(String nextImage) {
      print('aaaa');
      FadeInImage.memoryNetwork(height: 300, placeholder: null, image: image2);
      setState(
        () {
          showImage = nextImage;
        },
      );
    }

    final buttonWidth = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  width: buttonWidth,
                  child: RaisedButton(
                    onPressed: () {
                      _imageSwap(image1);
                    },
                    child: Container(child: Image.file(File(image1))),
                  ),
                ),
                Container(
                  height: 100,
                  width: buttonWidth,
                  child: RaisedButton(
                    onPressed: () {
                      _imageSwap(image2);
                    },
                    child: Container(child: Image.file(File(image2))),
                  ),
                ),
                Container(
                  height: 100,
                  width: buttonWidth,
                  child: RaisedButton(
                    onPressed: () {
                      _imageSwap(image3);
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () async {

          await releaseOrientation();

          try {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EndRegMyPet(),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
