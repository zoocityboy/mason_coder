import 'package:mason_coder/mason_coder.dart';
import 'package:path/path.dart';
import 'package:promptly/promptly.dart';
import 'package:universal_io/io.dart';

class BaseCommand extends Command<int> {
  BaseCommand(
    super.name,
    super.description, {
    super.aliases,
    super.category,
  });
  File get brickFile => File(join(Directory.current.path, Constants.brickFolder, 'brick.yaml'));
  bool get brickFileExists {
    return brickFile.existsSync();
  }
}
