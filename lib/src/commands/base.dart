import 'package:args/command_runner.dart';
import 'package:mason_coder/mason_coder.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

class BaseCommand extends Command<void> {
  BaseCommand(this._name, this._description);
  final String _name;
  @override
  String get name => _name;
  final String _description;
  @override
  String get description => _description;

  Console get logger => Console();

  bool get check {
    return File(join(Directory.current.path, Constants.bricksFolder)).existsSync();
  }
}
