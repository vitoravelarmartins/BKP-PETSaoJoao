import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:petsaojoao/components/comp_reg_my_pet/picture_info.dart';
import 'package:petsaojoao/components/comp_reg_my_pet/camera_info.dart';
import 'package:petsaojoao/screens/reg_my_pet/take_third_picture.dart';

class TakeSecondPic extends StatefulWidget {
  final CameraDescription camera;
  final String image1;

  const TakeSecondPic({
    Key key,
    @required this.camera,
    @required this.image1,
  }) : super(key: key);

  @override
  _TakeSecondPicState createState() => _TakeSecondPicState();
}

class _TakeSecondPicState extends State<TakeSecondPic> {
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
  TakeSecondPic get widget => super.widget;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String image1 = widget.image1;
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
                Container(height: 200, child: Image.file(File(image1)))
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final path =
                join((await getTemporaryDirectory()).path, 'PET-img2.png');

            if (File(path).existsSync()) {
              File(path).deleteSync(recursive: true);
              PaintingBinding.instance.imageCache.clear();
            }

            final camera = await getCameraInfo();
            final image1 = await getFirstPic();
            final image2 = await getSecondPic();
            await _controller.takePicture(path);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TakeThirdPic(
                  camera: camera,
                  image1: image1,
                  image2: image2,
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
