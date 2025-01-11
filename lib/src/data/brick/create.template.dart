part of 'creator.dart';

class ProcessTemplate {
  const ProcessTemplate(this.tpl);
  final TemplateYaml tpl;

  List<TemplateFile> generate() {
    List<String> ignorePathes = tpl.clean ?? [];
    List<TemplateFile> files = [];
    for (final dir in tpl.source) {
      final rootFolder = Directory(p.join(Directory.current.path, dir.replaceAll('\\', Platform.pathSeparator)));
      if (!rootFolder.existsSync()) {
        throw Exception('Source folder does not exist: ${rootFolder.path}');
      }
      final contentFiles = rootFolder.listSync(recursive: true).where((e) {
        final path = e.path.replaceAll('\\', Platform.pathSeparator);
        final isOk = !ignorePathes.any((ignore) => path.contains(ignore));
        return isOk;
      });
      for (final tmp in contentFiles) {
        final file = tmp;
        if (file is File) {
          final processedContentOfFile = _processContent(file);
          final rel = p.relative(file.path);
          final path = _replacePath(rel).join(Platform.pathSeparator);
          final filePath = p.join(tpl.target, BrickYaml.dir, path);
          final templateFile = TemplateFile(
            filePath,
            processedContentOfFile,
          );
          files.add(templateFile);
        }
      }
    }

    return files;
  }

  @protected
  String _processContent(File file) {
    final sb = StringBuffer();
    final lineContents = file.readAsLinesSync();
    for (final line in lineContents) {
      final processedLine = _processLine(line);
      sb.writeln(processedLine);
    }
    return sb.toString();
  }

  @protected
  String _processLine(String tmp) {
    var line = tmp;

    final prefixedEnteries = tpl.replaces.contents.where((e) => e.prefix != null).toList();
    final unprefixedEnteries = tpl.replaces.contents.where((e) => e.prefix == null).toList();
    for (final pair in prefixedEnteries) {
      if (line.contains(pair.key)) line = '${pair.prefix}${line.replaceAll(pair.key, pair.value)}${pair.suffix}';
    }
    for (final pair in unprefixedEnteries) {
      if (line.contains(pair.key)) {
        line = line.replaceAll(pair.key, pair.value);
      }
    }

    return line;
  }

  @protected
  List<String> _replacePath(String path) {
    final filePathSegments = path.replaceAll('\\', Platform.pathSeparator).split(Platform.pathSeparator);
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
