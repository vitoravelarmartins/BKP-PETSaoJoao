import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import 'package:petsaojoao/pages/cad_meu_animal/confirm_screen.dart';
import 'package:petsaojoao/components/comp_cad_meu_animal/picture_info.dart';

class TirarTerceiraFoto extends StatefulWidget {
  final CameraDescription camera;
  final String image1;
  final String image2;

  const TirarTerceiraFoto({
    Key key,
    @required this.camera,
    @required this.image1,
    @required this.image2,
  }) : super(key: key);

  @override
  TirarTerceiraFotoState createState() => TirarTerceiraFotoState();
}

class TirarTerceiraFotoState extends State<TirarTerceiraFoto> {
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
  TirarTerceiraFoto get widget => super.widget;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imagem1 = widget.image1;
    String imagem2 = widget.image2;
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
                      Container(height: 200, child: Image.file(File(imagem1))),
                      Container(height: 200, child: Image.file(File(imagem2)))
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

            final imagem1 = await getPrimeiraFoto();
            final imagem2 = await getSegundaFoto();
            final imagem3 = await getTerceiraFoto();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaConfirmacao(
                  image1: imagem1,
                  image2: imagem2,
                  image3: imagem3,
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
