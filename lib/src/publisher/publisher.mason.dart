part of 'publisher.dart';

/// {@template brick_mason_coder}
/// A bundle generator is responsible for generating a
/// brick bundle for a given [MasonBundle].
///
/// See also:
///
/// * [_BrickDartBundleGenerator], a bundle generator which generates a Dart
/// bundle.
/// * [_BrickUniversalBundleGenerator], a bundle generator which generates a
/// universal bundle.
/// {@endtemplate}
abstract class _BrickBundleGenerator {
  /// {@macro brick_mason_coder}
  const _BrickBundleGenerator({
    required this.bundleFile,
    required MasonBundle bundle,
  }) : _bundle = bundle;

  /// The respective [MasonBundle] for which a brick bundle will be generated.
  final MasonBundle _bundle;

  /// The file that we will be writing the brick bundle to.
  final File bundleFile;

  /// Generates the brick bundle file for the given [MasonBundle].
  Future<void> generate();
}

/// {@template brick_dart_mason_coder}
/// A bundle generator which generates a Dart bundle.
/// {@endtemplate}
class _BrickDartBundleGenerator extends _BrickBundleGenerator {
  /// {@macro brick_dart_mason_coder}
  _BrickDartBundleGenerator({
    required String outputDirectoryPath,
    required super.bundle,
  }) : super(
          bundleFile: File(
            path.join(outputDirectoryPath, '${bundle.name}_bundle.dart'),
          ),
        );

  @override
  Future<void> generate() async {
    await bundleFile.create(recursive: true);
    await bundleFile.writeAsString(
      "// GENERATED CODE - DO NOT MODIFY BY HAND\n// ignore_for_file: type=lint, implicit_dynamic_list_literal, implicit_dynamic_map_literal, inference_failure_on_collection_literal\n\nimport 'package:mason/mason.dart';\n\nfinal ${_bundle.name.camelCase}Bundle = MasonBundle.fromJson(<String, dynamic>${json.encode(_bundle.toJson())});",
    );
  }
}

/// {@template brick_universal_mason_coder}
/// A bundle generator which generates a universal bundle.
/// {@endtemplate}
class _BrickUniversalBundleGenerator extends _BrickBundleGenerator {
  /// {@macro brick_universal_mason_coder}
  _BrickUniversalBundleGenerator({
    required String outputDirectoryPath,
    required super.bundle,
  }) : super(
          bundleFile: File(
            path.join(outputDirectoryPath, '${bundle.name}.bundle'),
          ),
        );

  @override
  Future<void> generate() async {
    await bundleFile.create(recursive: true);
    await bundleFile.writeAsBytes(await _bundle.toUniversalBundle());
  }
}
