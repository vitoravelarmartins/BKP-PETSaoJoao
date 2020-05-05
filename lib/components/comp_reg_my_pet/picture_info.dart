import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

getFirstPic() async {
  final path = join((await getTemporaryDirectory()).path, 'PET-img1.png');

  return path;
}

getSecondPic() async {
  final path = join((await getTemporaryDirectory()).path, 'PET-img2.png');

  return path;
}

getThirdPic() async {
  final path = join((await getTemporaryDirectory()).path, 'PET-img3.png');

  return path;
}
