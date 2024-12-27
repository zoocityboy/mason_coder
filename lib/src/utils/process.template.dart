import 'package:mason_coder/mason_coder.dart';
import 'package:mason_coder/src/data/config/replace_variable_properties.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

class ProcessTemplate {
  const ProcessTemplate();

  // /// Copy processed file to target location
  // Future<void> path(TemplateYaml tpl, File file, List<String> targetPathSegments) async {
  //   final root = targetPathSegments.sublist(3).join(Platform.pathSeparator);
  //   final newPath = p.join(tpl.brickDestinationPath, root);

  //   final rel = p.relative(newPath, from: tpl.brickRootPath);
  //   await File(newPath).create(recursive: true);
  //   await file.rename(newPath);
  // }

  /// Replace tokens in body of file

  void replaceContent(TemplateYaml tpl, File _) {
    final file = _;
    final sb = StringBuffer();
    final lineContents = file.readAsLinesSync();
    for (final line in lineContents) {
      sb.writeln(processLine(tpl, line));
    }
    file.writeAsStringSync(sb.toString());
  }

  /// Process line replace
  String processLine(TemplateYaml tpl, String _) {
    var line = _;
    // final isImportLine = line.trim().startsWith('import ');
    // if (isImportLine) {

    //   line = processImport(line, tpl.replaces.imports);
    // } else {
    final prefixedEnteries = tpl.replaces.contents.where((e) => e.prefix != null).toList();
    final unprefixedEnteries = tpl.replaces.contents.where((e) => e.prefix == null).toList();
    for (final pair in prefixedEnteries) {
      line = '${pair.prefix}${line.replaceAll(pair.key, pair.value)}${pair.suffix}';
    }
    for (final pair in unprefixedEnteries) {
      line = line.replaceAll(pair.key, pair.value);
    }
    // }
    return line;
  }

  /// Process import line

  String processImport(String _, List<ReplaceVariableProperties> entries) {
    var line = _;
    if (entries.isEmpty) {
      return line;
    }

    /// Get import content
    final importSegments = Constants.importLineContent.firstMatch(line)?.group(1);
    if (importSegments != null) {
      final fileSegments = importSegments.split('/');
      final newSegments = <String>[];
      var pre = '';
      var post = '';
      for (final segment in fileSegments) {
        var newSegmentItem = segment;
        for (final i in entries) {
          if (newSegmentItem.contains(i.key) || newSegmentItem == i.key) {
            if (i.prefix != null && i.suffix != null) {
              pre = i.prefix!;
              post = i.suffix!;
            }
            newSegmentItem = newSegmentItem.replaceAll(i.key, i.value);
          }
          newSegments.add(newSegmentItem);
        }
      }
      line = "${pre}import '${newSegments.join('/')}';$post";
    }
    return line;
  }

  /// Replace path tokens with definition from Template

  List<String> replacePath(TemplateYaml tpl, File file) {
    final rel = p.relative(file.path, from: Directory.current.path);
    final filePathSegments = rel.split(Platform.pathSeparator);
    final newPathSegments = <String>[];
    final entries = tpl.replaces.paths.toList();
    for (final segment in filePathSegments) {
      var newSegmentItem = segment;
      for (final i in entries) {
        if (newSegmentItem.contains(i.key) || newSegmentItem == i.key) {
          if (i.prefix != null && i.suffix != null) {
            newSegmentItem = '${newSegmentItem.replaceAll(i.key, '${i.prefix ?? ''}${i.value}')}${i.suffix ?? ''}';
          } else {
            newSegmentItem = newSegmentItem.replaceAll(i.key, i.value);
          }
        }
      }
      newPathSegments.add(newSegmentItem);
    }
    return newPathSegments;
  }
}
