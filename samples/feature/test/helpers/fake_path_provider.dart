part of 'helpers.dart';

const String kTemporaryPath = 'temporaryPath';
const String kApplicationSupportPath = 'applicationSupportPath';
const String kDownloadsPath = 'downloadsPath';
const String kLibraryPath = 'libraryPath';
const String kApplicationDocumentsPath = 'applicationDocumentsPath';
const String kExternalCachePath = 'externalCachePath';
const String kExternalStoragePath = 'externalStoragePath';

class FakePathProviderPlatform extends Mock with MockPlatformInterfaceMixin implements PathProviderPlatform {
  FakePathProviderPlatform() {
    baseDir = '${Directory.systemTemp.path}/${DateTime.now().millisecondsSinceEpoch}/';
  }
  late final String baseDir;
  @override
  Future<String?> getTemporaryPath() async {
    return baseDir + kTemporaryPath;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    return baseDir + kApplicationSupportPath;
  }

  @override
  Future<String?> getLibraryPath() async {
    return baseDir + kLibraryPath;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    return baseDir + kApplicationDocumentsPath;
  }

  @override
  Future<String?> getExternalStoragePath() async {
    return baseDir + kExternalStoragePath;
  }

  @override
  Future<List<String>?> getExternalCachePaths() async {
    return <String>[baseDir + kExternalCachePath];
  }

  @override
  Future<List<String>?> getExternalStoragePaths({
    StorageDirectory? type,
  }) async {
    return <String>[baseDir + kExternalStoragePath];
  }

  @override
  Future<String?> getDownloadsPath() async {
    return baseDir + kDownloadsPath;
  }
}
