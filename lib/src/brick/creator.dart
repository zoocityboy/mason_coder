import 'dart:convert';

import 'package:json2yaml/json2yaml.dart';
import 'package:mason/mason.dart';
// ignore: implementation_imports
import 'package:mason/src/brick_yaml.dart' show VarsConverter, BrickVariableProperties;
import 'package:mason_coder/mason_coder.dart';
import 'package:meta/meta.dart';
// import 'package:mason_coder/mason_coder.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

part 'create.template.dart';
part 'creator.brickfile.dart';
part 'creator.changelog.dart';
part 'creator.hooks.dart';
part 'creator.license.dart';
part 'creator.readme.dart';

class BrickCreatorGenerator extends MasonGenerator {
  factory BrickCreatorGenerator.create(TemplateYaml tpl) =>
      BrickCreatorGenerator._(tpl, processor: ProcessTemplate(tpl));

  final TemplateYaml tpl;
  final ProcessTemplate processor;

  BrickCreatorGenerator._(
    this.tpl, {
    bool createHooks = true,
    required this.processor,
  }) : super(
          '__new_brick__',
          'Creates a new brick.',
          files: [
            TemplateFile(
              BrickYaml.file,
              brickYamlContent(
                name: tpl.name,
                description: tpl.description,
                masonVersion: tpl.version,
                vars: tpl.vars,
              ),
            ),
            TemplateFile(
              'README.md',
              _brickReadmeContent(tpl.name, tpl.description),
            ),
            TemplateFile(
              'CHANGELOG.md',
              _brickChangelogContent(tpl.name, tpl.version),
            ),
            TemplateFile(
              'LICENSE',
              _brickLicenseContent(),
            ),
            TemplateFile(
              p.join(BrickYaml.dir, 'HELLO.md'),
              'Hello {{name}}!',
            ),
            // ...files,
            if (createHooks) ...[...hooksFiles(tpl, createHooks: createHooks)],
          ],
          vars: tpl.vars.keys.toList(),
        );
  static List<TemplateFile> hooksFiles(TemplateYaml tpl, {bool createHooks = false}) {
    final List<TemplateFile> files = [];
    final hooksFolder = Directory(Constants.hooksFolder);

    if (hooksFolder.existsSync()) {
      files.addAll(hooksFolder.listSync(recursive: true).whereType<File>().map((file) => TemplateFile(
            p.join(BrickYaml.hooks, p.basename(file.path)),
            file.readAsStringSync(),
          )));
    } else {
      files.addAll(createHooks
          ? <TemplateFile>[
              TemplateFile(
                p.join(BrickYaml.hooks, 'pubspec.yaml'),
                _hooksPubspecContent(tpl.name, tpl.version),
              ),
              TemplateFile(
                p.join(BrickYaml.hooks, 'pre_gen.dart'),
                _hooksPreGenContent,
              ),
              TemplateFile(
                p.join(BrickYaml.hooks, 'post_gen.dart'),
                _hooksPostGenContent,
              ),
              TemplateFile(
                p.join(BrickYaml.hooks, '.gitignore'),
                _hooksGitignoreContent,
              ),
            ]
          : []);
    }
    stdout.writeln('files: $files');
    return files;
  }

  void process() {
    final files = processor.generate();
    for (final file in files) {
      final targetFile = File(file.path);
      if (!targetFile.existsSync()) {
        targetFile.createSync(recursive: true);
      }
      targetFile.writeAsStringSync(utf8.decode(file.content));
    }
  }
}
