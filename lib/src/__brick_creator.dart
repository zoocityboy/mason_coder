// import 'dart:isolate';

// import 'package:mason_coder/mason_coder.dart';
// import 'package:mason_coder/src/l.dart';
// import 'package:http/http.dart' as http;
// import 'package:interact_cli/interact_cli.dart';
// import 'package:json2yaml/json2yaml.dart';
// import 'package:mason/mason.dart';
// // ignore: implementation_imports
// import 'package:mason/src/generator.dart';
// import 'package:meta/meta.dart';
// import 'package:path/path.dart' as p;
// import 'package:universal_io/io.dart';

// class BrickCreator {
//   static Console console = Console();
//   static Logger masonLogger = Logger();
//   BrickCreator._(this.tpl);
//   static BrickCreator init() => BrickCreator._(TemplateYaml.load());

//   final TemplateYaml tpl;

//   Future<void> generate() async {
//     final processor = ProcessTemplate();
//     late TemplateYaml tpl;

//     var progress = console.progress(L.listProcessing);
//     try {
//       tpl = TemplateYaml.load();
//       await preProcess(tpl);
//     } on BundleTplConfigFileNotFound catch (e) {
//       print(e);
//       progress.failed('Config file not found');
//       exit(1);
//     }
//     late Spinner2State spinner = console.progress('${tpl.name} - ${L.processing}');
//     try {
//       final files = <File>[];
//       if (tpl.source != '/') {
//         final files0 = Directory(tpl.brickSourceFolderPath)
//             .listSync(recursive: true)
//             .whereType<File>()
//             .where(
//               (element) => !element.path.endsWith('.DS_Store'),
//             )
//             .toList();
//         files.addAll(files0);
//       } else {
//         final templateFiles = tpl.files
//             .map(
//               (e) => File(p.join(Directory.current.path, tpl.brickSourcePath(e))),
//             )
//             .toList();
//         files.addAll(templateFiles);
//       }

//       // spinner.update('Files found: ${files.length}');
//       for (final _ in files) {
//         final file = _;
//         await processor.replaceContent(tpl, file);
//         final value = await processor.replacePath(tpl, file);
//         await processor.path(tpl, file, value);
//         // spinner.update('Processed: ${files.indexOf(file) + 1}/${files.length} ${file.path}');
//       }

//       await postProcess(tpl);
//       spinner.success('Done');
//     } catch (e) {
//       spinner.failed('Failed');
//     }
//   }

//   Future<void> clean() async {
//     final progress = console.progress('Cleaning up');
//     try {
//       final path = [Directory.current.path, Constants.bricksFolder].join(Platform.pathSeparator);
//       final dir = Directory(path);
//       if (dir.existsSync()) {
//         await dir.delete(recursive: true);
//       }
//       progress.success('Cleaned');
//     } catch (e) {
//       progress.failed('Failed');
//     }
//   }

//   @protected
//   Future<void> removeBrick(String name) async {
//     final path = [Directory.current.path, Constants.bricksFolder, name].join(Platform.pathSeparator);
//     final dir = Directory(path);
//     if (dir.existsSync()) {
//       await dir.delete(recursive: true);
//     }
//   }

//   @protected
//   Future<void> makeTemplateFromBundle(TemplateYaml tpl) async {
//     await Shell.mkdir(tpl.brickDestinationPath);
//     final brick = GenericBrickGenerator(tpl.name, tpl.description, createHooks: false);

//     // final x = _MasonYamlGenerator();
//     final data = {'vars': tpl.varsToJson()};
//     final vars = <String, dynamic>{
//       'mbg_header': stripHtmlIfNeeded(L.templateHeader),
//       'mbg_template_name': stripHtmlIfNeeded(tpl.name),
//       'mbg_template_description': stripHtmlIfNeeded(tpl.description),
//       'mbg_template_vars': json2yaml(data),
//       'mbg_brick_version': Constants.brickVersion,
//       'mbg_mason_range': Constants.brickMasonRange,
//     };

//     await brick.generate(
//       DirectoryGeneratorTarget(Directory(tpl.brickDestinationPath)),
//       logger: masonLogger,
//       vars: vars,
//     );

//     // await makeHooks();
//   }

//   Future<void> makeHooks() async {
//     if (Directory(Constants.hooksFolder).existsSync()) {
//       Shell.mkdir(tpl.brickSourceHooksPath);
//       await Shell.cp(Constants.hooksFolder, tpl.brickSourceFolderPath);
//     }
//   }

//   @protected
//   Future<void> preProcess(TemplateYaml tpl) async {
//     await makeTemplateFromBundle(tpl);
//     if (tpl.files.isNotEmpty) {
//       for (final filePath in tpl.files) {
//         final sourceFile = File(filePath);
//         final destinationPath = tpl.brickSourcePath(filePath);
//         final destinationFile = File(destinationPath);
//         if (!destinationFile.parent.existsSync()) {
//           Directory(destinationFile.parent.path).createSync(recursive: true);
//         }
//         sourceFile.copySync(tpl.brickSourcePath(filePath));

//         // await Shell.cp(p.join(tpl.templateTargetPath, file), tpl.processTargetPathFromFileNode(file));
//       }
//     } else {
//       await Shell.mkdir(tpl.brickSourceFolderPath);
//       await Shell.cp(tpl.appSourcePath, tpl.brickSourceFolderPath);
//     }
//   }

//   /// postProcess will clear temporary files created by generator process
//   Future<void> postProcess(TemplateYaml tpl) async {
//     final temp = Directory(tpl.brickSourceDestinationPath);
//     if (temp.existsSync()) {
//       await Shell.rm(tpl.brickSourceDestinationPath);
//     }
//   }
// }

// String stripHtmlIfNeeded(String text) {
//   return text.replaceAll(RegExp('<[^>]*>|&[^;]+;'), ' ');
// }

// // class _MasonYamlGenerator extends MasonGenerator {
// //   _MasonYamlGenerator()
// //       : super('__mason_init__', 'Initialize a new ${MasonYaml.file}',
// //             files: [TemplateFile(MasonYaml.file, _masonYamlContent)],
// //             hooks: GeneratorHooks(
// //               preGenHook: HookFile.fromBytes(
// //                 Constants.hooksFolder,
// //                 File(p.join(Constants.hooksFolder, 'pre_gen.dart')).readAsBytesSync(),
// //               ),
// //               postGenHook: HookFile.fromBytes(
// //                 Constants.hooksFolder,
// //                 File(p.join(Constants.hooksFolder, 'post_gen.dart')).readAsBytesSync(),
// //               ),
// //               pubspec: File(p.join(Constants.hooksFolder, 'pubspec.yaml')).readAsBytesSync(),
// //             ));
// //   static const _hookPubspec = '''
// // name: {{{mbg_template_name}}}_hooks

// // environment:
// //   sdk: ">=3.0.0 <4.0.0"

// // dependencies:
// //   mason: {{{mbg_mason_range}}}
// // ''';
// //   static const _masonYamlContent = '''
// // # {{{mbg_header}}}
// // name: {{{mbg_template_name}}}
// // description: {{{mbg_template_description}}}
// // version: {{{mbg_brick_version}}}
// // environment:
// //   mason: {{{mbg_mason_range}}}

// // {{{mbg_template_vars}}}
// // ''';
// // }

// class GenericBrickGenerator extends MasonGenerator {
//   GenericBrickGenerator(
//     this.brickName,
//     this.brickDescription, {
//     this.createHooks = false,
//     List<String> vars = const <String>[],
//   }) : super(
//           '__new_brick__',
//           'Creates a new brick.',
//           files: [
//             TemplateFile(
//               p.join(brickName, BrickYaml.file),
//               brickYamlContent(name: brickName, description: brickDescription,),
//             ),
//             TemplateFile(
//               p.join(brickName, 'README.md'),
//               _brickReadmeContent(brickName, brickDescription),
//             ),
//             TemplateFile(
//               p.join(brickName, 'CHANGELOG.md'),
//               _brickChangelogContent,
//             ),
//             TemplateFile(
//               p.join(brickName, 'LICENSE'),
//               _brickLicenseContent,
//             ),
//             TemplateFile(
//               p.join(brickName, BrickYaml.dir, 'HELLO.md'),
//               'Hello {{name}}!',
//             ),
//             if (createHooks) ...[...hooksFiles(brickName)],
//           ],
//           vars: vars,
//         );
//   static List<TemplateFile> hooksFiles(String brickName, {bool createHooks = false}) {
//     final List<TemplateFile> files = [];
//     final hooksFolder = Directory(Constants.hooksFolder);
//     stdout.writeln('hooksFolder: $hooksFolder ${hooksFolder.existsSync()}');

//     if (hooksFolder.existsSync()) {
//       files.addAll(hooksFolder.listSync(recursive: true).whereType<File>().map((file) => TemplateFile(
//             file.path,
//             file.readAsStringSync(),
//           )));
//     } else {
//       files.addAll(createHooks
//           ? <TemplateFile>[
//               TemplateFile(
//                 p.join(brickName, BrickYaml.hooks, 'pubspec.yaml'),
//                 _hooksPubspecContent(brickName),
//               ),
//               TemplateFile(
//                 p.join(brickName, BrickYaml.hooks, 'pre_gen.dart'),
//                 _hooksPreGenContent,
//               ),
//               TemplateFile(
//                 p.join(brickName, BrickYaml.hooks, 'post_gen.dart'),
//                 _hooksPostGenContent,
//               ),
//               TemplateFile(
//                 p.join(brickName, BrickYaml.hooks, '.gitignore'),
//                 _hooksGitignoreContent,
//               ),
//             ]
//           : []);
//     }
//     stdout.writeln('files: $files');
//     return files;
//   }

// //   static String _brickYamlContent(String name, String description) => '''
// // name: $name
// // description: $description
// // version: 0.1.0+1
// // environment:
// //   mason: ^$packageVersion
// // vars:
// // ''';

//   static String _brickReadmeContent(String name, String description) => '''
// # $name

// [![Powered by Mason Bundler](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/zoocityboy/mason_bundler)

// $description

// ''';

//   static const _brickChangelogContent = '''
// # 0.1.0+1

// - TODO: Describe initial release.
// ''';

//   static final _brickLicenseContent = '''
// TODO: License (${DateTime.now().year})
// ''';

//   static String _hooksPubspecContent(String name) => '''
// name: ${name}_hooks

// environment:
//   sdk: ^3.5.0

// dependencies:
//   mason: ^$packageVersion
// ''';

//   static const _hooksGitignoreContent = '''
// .dart_tool
// .packages
// pubspec.lock
// build
// ''';

//   static const _hooksPreGenContent = '''
// import 'package:mason/mason.dart';

// void run(HookContext context) {
//   // TODO: add pre-generation logic.
// }
// ''';
//   static const _hooksPostGenContent = '''
// import 'package:mason/mason.dart';

// void run(HookContext context) {
//   // TODO: add post-generation logic.
// }
// ''';

//   final String brickName;
//   final String brickDescription;
//   final bool createHooks;
// }

// final _fileRegExp = RegExp(r'{{%\s?([a-zA-Z]+)\s?%}}');

// class CustomGenerator extends MasonGenerator {
//   CustomGenerator(super.id, super.description);

//   /// Generates files based on the provided [GeneratorTarget] and [vars].
//   /// Returns a list of [GeneratedFile].
//   @override
//   Future<List<GeneratedFile>> generate(
//     GeneratorTarget target, {
//     Map<String, dynamic> vars = const <String, dynamic>{},
//     FileConflictResolution? fileConflictResolution,
//     Logger? logger,
//   }) async {
//     final overwriteRule = fileConflictResolution?.toOverwriteRule();
//     final generatedFiles = <GeneratedFile>[];
//     await Future.forEach<TemplateFile>(files, (TemplateFile file) async {
//       final fileMatch = _fileRegExp.firstMatch(file.path);
//       if (fileMatch != null) {
//         final resultFile = await _fetch(vars[fileMatch[1]] as String);
//         if (resultFile.path.isEmpty) return;
//         final generatedFile = await target.createFile(
//           p.basename(resultFile.path),
//           resultFile.content,
//           logger: logger,
//           overwriteRule: overwriteRule,
//         );
//         generatedFiles.add(generatedFile);
//       } else {
//         final resultFiles = await _runSubstitutionAsync(
//           file,
//           Map<String, dynamic>.of(vars),
//           Map<String, List<int>>.of(partials),
//         );
//         final root = RegExp(r'\w:\\|\w:\/');
//         final separator = RegExp(r'\/|\\');
//         final rootOrSeparator = RegExp('$root|$separator');
//         final wasRoot = file.path.startsWith(rootOrSeparator);
//         for (final file in resultFiles) {
//           final isRoot = file.path.startsWith(rootOrSeparator);
//           if (!wasRoot && isRoot) continue;
//           if (file.path.isEmpty) continue;
//           if (file.path.split(separator).contains('')) continue;
//           final generatedFile = await target.createFile(
//             file.path,
//             file.content,
//             logger: logger,
//             overwriteRule: overwriteRule,
//           );
//           generatedFiles.add(generatedFile);
//         }
//       }
//     });
//     return generatedFiles;
//   }

//   Future<FileContents> _fetch(String path) async {
//     final file = File(path);
//     final isLocal = file.existsSync();
//     if (isLocal) {
//       final target = p.join(Directory.current.path, p.basename(file.path));
//       final bytes = await file.readAsBytes();
//       return FileContents(target, bytes);
//     } else {
//       final uri = Uri.parse(path);
//       final target = p.join(Directory.current.path, p.basename(uri.path));
//       final response = await http.Client().get(uri);
//       return FileContents(target, response.bodyBytes);
//     }
//   }
// }

// _runSubstitutionAsync(
//   TemplateFile file,
//   Map<String, dynamic> vars,
//   Map<String, List<int>> partials,
// ) async {
//   return Isolate.run(() => file.runSubstitution(vars, partials));
// }

// extension on FileConflictResolution {
//   OverwriteRule? toOverwriteRule() {
//     switch (this) {
//       case FileConflictResolution.overwrite:
//         return OverwriteRule.alwaysOverwrite;
//       case FileConflictResolution.skip:
//         return OverwriteRule.alwaysSkip;
//       case FileConflictResolution.append:
//         return OverwriteRule.alwaysAppend;
//       case FileConflictResolution.prompt:
//         return null;
//     }
//   }
// }
