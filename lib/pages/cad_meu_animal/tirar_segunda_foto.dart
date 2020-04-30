import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:petsaojoao/components/comp_cad_meu_animal/fotos_info.dart';
import 'package:petsaojoao/components/comp_cad_meu_animal/camera_info.dart';
import 'package:petsaojoao/pages/cad_meu_animal/tirar_terceira_foto.dart';

class TirarSegundaFoto extends StatefulWidget {
  final CameraDescription camera;
  final String image1;

  const TirarSegundaFoto({
    Key key,
    @required this.camera,
    @required this.image1,
  }) : super(key: key);

  @override
  TirarSegundaFotoState createState() => TirarSegundaFotoState();
}

class TirarSegundaFotoState extends State<TirarSegundaFoto> {
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
  TirarSegundaFoto get widget => super.widget;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imagem1 = widget.image1;
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
                Container(height: 200, child: Image.file(File(imagem1)))
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
            final imagem1 = await getPrimeiraFoto();
            final imagem2 = await getSegundaFoto();
            await _controller.takePicture(path);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TirarTerceiraFoto(
                  camera: camera,
                  image1: imagem1,
                  image2: imagem2,
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
