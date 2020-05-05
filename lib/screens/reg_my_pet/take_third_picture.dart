import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

<<<<<<< HEAD:lib/screens/reg_my_pet/take_third_picture.dart
import 'package:petsaojoao/screens/reg_my_pet/confirm_screen.dart';
import 'package:petsaojoao/components/comp_reg_my_pet/picture_info.dart';
=======
import 'package:petsaojoao/screens/cad_meu_animal/confirm_screen.dart';
import 'package:petsaojoao/components/my_pet/picture_info.dart';
>>>>>>> f8af7b1fb20d0131f7d230b62fef66564c801724:lib/screens/cad_meu_animal/take_third_picture.dart

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
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text('2 de 3 fotos registradas'),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 120,
                        padding: EdgeInsets.only(right: 20),
                        child: Image.file(File(image1)),
                      ),
                      Container(
                        height: 120,
                        child: Image.file(File(image2)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.5,
                )
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
