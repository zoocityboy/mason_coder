part of 'publisher.dart';

// MasonBundle createBundle(Directory brick) {
//   final brickYamlFile = File(path.join(brick.path, BrickYaml.file));
//   if (!brickYamlFile.existsSync()) {
//     throw BrickNotFoundException(brickYamlFile.path);
//   }
//   final brickYaml = checkedYamlDecode(
//     brickYamlFile.readAsStringSync(),
//     (m) => BrickYaml.fromJson(m!),
//   );
//   final brickDir = Directory(path.join(brick.path, BrickYaml.dir));
//   final files = brickDir.existsSync()
//       ? brickDir.listSync(recursive: true).whereType<File>().map(_bundleBrickFile).toList()
//       : <MasonBundledFile>[];
//   final hooksDirectory = Directory(path.join(brick.path, BrickYaml.hooks));
//   final hooks = hooksDirectory.existsSync()
//       ? hooksDirectory
//           .listSync(recursive: true)
//           .whereType<File>()
//           .where((file) => _hookFiles.hasMatch(path.basename(file.path)))
//           .map((file) => _bundleHookFile(file, hooksDirectory))
//           .toList()
//       : <MasonBundledFile>[];
//   return MasonBundle(
//     name: brickYaml.name,
//     description: brickYaml.description,
//     version: brickYaml.version,
//     environment: brickYaml.environment,
//     vars: brickYaml.vars,
//     repository: brickYaml.repository,
//     publishTo: brickYaml.publishTo,
//     files: files..sort(_comparePaths),
//     hooks: hooks..sort(_comparePaths),
//     readme: _bundleTopLevelFile(brick, 'README.md'),
//     changelog: _bundleTopLevelFile(brick, 'CHANGELOG.md'),
//     license: _bundleTopLevelFile(brick, 'LICENSE'),
//   );
// }
