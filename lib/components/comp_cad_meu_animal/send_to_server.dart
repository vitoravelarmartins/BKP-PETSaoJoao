import 'package:dio/dio.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

sendToServer() async {
  final pathImg = join(
    (await getTemporaryDirectory()).path,
    'PET-img1.png',
  );
  final pathImg2 = join(
    (await getTemporaryDirectory()).path,
    'PET-img2.png',
  );
  final pathImg3 = join(
    (await getTemporaryDirectory()).path,
    'PET-img3.png',
  );

  try {
    String link = 'http:// API LINK : PORTA / ROTA';
    Dio dio = new Dio();

    FormData data = new FormData.fromMap({
      "imageFlutter": [
        await MultipartFile.fromFile(pathImg, filename: 'PET-img1.png'),
        await MultipartFile.fromFile(pathImg2, filename: 'PET-img2.png'),
        await MultipartFile.fromFile(pathImg3, filename: 'PET-img3.png')
      ]
    });

    await dio.post(link, data: data);
  } catch (e) {
    print(e);
  }
}
