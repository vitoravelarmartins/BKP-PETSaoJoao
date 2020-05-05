import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:petsaojoao/screens/cad_meu_animal/confirm_screen.dart';
import 'package:petsaojoao/components/my_pet/picture_info.dart';

class TakeThirdPic extends StatefulWidget {
  final CameraDescription camera;
  final String image1;
  final String image2;

  const TakeThirdPic({
    Key key,
    @required this.camera,
    @required this.image1,
    @required this.image2,
  }) : super(key: key);

  @override
  _TakeThirdPicState createState() => _TakeThirdPicState();
}

class _TakeThirdPicState extends State<TakeThirdPic> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  // TODO: implement widget
  TakeThirdPic get widget => super.widget;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = widget.image1;
    String image2 = widget.image2;
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: CameraPreview(_controller)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(height: 200, child: Image.file(File(image1))),
                      Container(height: 200, child: Image.file(File(image2)))
                    ],
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final path =
                join((await getTemporaryDirectory()).path, 'PET-img3.png');

            if (File(path).existsSync()) {
              File(path).deleteSync(recursive: true);
              PaintingBinding.instance.imageCache.clear();
            }

            await _controller.takePicture(path);

            final image1 = await getFirstPic();
            final image2 = await getSecondPic();
            final image3 = await getThirdPic();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmScreen(
                  image1: image1,
                  image2: image2,
                  image3: image3,
                ),
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
