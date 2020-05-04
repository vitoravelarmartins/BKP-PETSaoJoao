import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

getPrimeiraFoto() async {
  final path = join((await getTemporaryDirectory()).path, 'PET-img1.png');

  return path;
}

getSegundaFoto() async {
  final path = join((await getTemporaryDirectory()).path, 'PET-img2.png');

  return path;
}

getTerceiraFoto() async {
  final path = join((await getTemporaryDirectory()).path, 'PET-img3.png');

  return path;
}
