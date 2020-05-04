import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:petsaojoao/components/comp_cad_meu_animal/camera_info.dart';
import 'package:petsaojoao/pages/cad_meu_animal/take_second_picture.dart';

class TirarPrimeiraFoto extends StatefulWidget {
  final CameraDescription camera;

  const TirarPrimeiraFoto({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TirarPrimeiraFotoState createState() => TirarPrimeiraFotoState();
}

class TirarPrimeiraFotoState extends State<TirarPrimeiraFoto> {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: CameraPreview(_controller));
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
                join((await getTemporaryDirectory()).path, 'PET-img1.png');

            if (File(path).existsSync()) {
              File(path).deleteSync(recursive: true);
              PaintingBinding.instance.imageCache.clear();
            }

            final camera = await getCameraInfo();
            await _controller.takePicture(path);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TirarSegundaFoto(camera: camera, image1: path),
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
