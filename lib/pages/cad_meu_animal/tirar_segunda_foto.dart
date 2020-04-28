import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:petsaojoao/components/comp_cad_meu_animal/camera_info.dart';
import 'package:petsaojoao/pages/cad_meu_animal/tela_confirmacao.dart';
import 'package:petsaojoao/pages/cad_meu_animal/tirar_terceira_foto.dart';

class TirarSegundaFoto extends StatefulWidget {
  final CameraDescription camera;

  const TirarSegundaFoto({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TirarSegundaFoto> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
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
      appBar: AppBar(title: Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
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

            final path = join(
              (await getTemporaryDirectory()).path,
              'PET-img2.png',
            );

            if (File(path).existsSync()) {
              File(path).deleteSync(recursive: true);
              PaintingBinding.instance.imageCache.clear();
            }

            await _controller.takePicture(path);

            final camera = await getCameraInfo();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaConfirmacao(
                    imagePath: path,
                    nextPage: TirarTerceiraFoto(camera: camera)),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
