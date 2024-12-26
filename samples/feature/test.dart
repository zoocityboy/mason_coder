import 'dart:io';

import 'package:path/path.dart';

void main() {
  final sourcePath = join(Directory.current.path, 'lib', 'features', 'tpl_feature_name');
  Directory(sourcePath).listSync(recursive: true).where((e) => e.path.endsWith('.dart')).forEach((element) {
    final relPath = relative(element.path, from: sourcePath);
    final exportPath = join(Directory.current.path, '.brick', '__brick__', relPath);
    stdout.writeln(exportPath);
  });
}
