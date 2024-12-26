part of 'creator.dart';

class ProcessTemplate {
  const ProcessTemplate(this.tpl);
  final TemplateYaml tpl;

  List<TemplateFile> generate() {
    List<String> ignorePathes = tpl.clean;
    List<TemplateFile> files = [];
    final rootFolder = Directory(p.join(Directory.current.path, tpl.source.replaceAll('\\', Platform.pathSeparator)));
    if (!rootFolder.existsSync()) {
      throw Exception('Source folder does not exist: ${rootFolder.path}');
    }
    final contentFiles = rootFolder.listSync(recursive: true).where((e) {
      final path = e.path.replaceAll('\\', Platform.pathSeparator);
      final isOk = !ignorePathes.any((ignore) => path.contains(ignore));
      return isOk;
    });
    for (final _ in contentFiles) {
      final file = _;
      if (file is File) {
        final processedContentOfFile = _processContent(file);
        final path = _replacePath(file).join(Platform.pathSeparator);
        final rel = p.relative(path, from: rootFolder.path);
        stdout.writeln('path: $path \nrel: $rel');
        final filePath = p.join(Constants.bricksFolder, BrickYaml.dir, p.relative(path, from: rootFolder.path));
        final templateFile = TemplateFile(
          filePath,
          processedContentOfFile,
        );
        files.add(templateFile);
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
  String _processLine(String _) {
    var line = _;

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
  List<String> _replacePath(File file) {
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
    stdout.writeln(newPathSegments);
    return newPathSegments;
  }
}
