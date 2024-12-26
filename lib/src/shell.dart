import 'dart:io';

/// Shell commands
class Shell {
  /// Copy files and folders
  static Future<void> cp(String source, String destination) {
    if (Platform.isWindows) {
      return _Cmd.run('xcopy', ['/E', '/I', source, destination]);
    }
    return _Cmd.run('cp', ['-r', '$source/.', destination]);
  }

  /// Delete files
  static Future<void> rm(String source) {
    if (Platform.isWindows) {
      return _Cmd.run('rmdir', ['/s', '/q', source]);
    }
    return _Cmd.run('rm', ['-rf', source]);
  }

  /// Create a new directory
  static Future<void> mkdir(String destination) {
    if (Platform.isWindows) {
      return _Cmd.run('mkdir', [destination, '/p']);
    }
    return _Cmd.run('mkdir', ['-p', destination]);
  }

  static Future<void> run(String command, List<String> args) {
    return _Cmd.run(command, args);
  }
}

class _Cmd {
  static Future<ProcessResult> run(
    String cmd,
    List<String> args, {
    bool throwOnError = true,
    String? processWorkingDir,
  }) async {
    final result = await Process.run(cmd, args, workingDirectory: processWorkingDir, runInShell: true);

    if (throwOnError) {
      _throwIfProcessFailed(result, cmd, args);
    }
    return result;
  }

  static void _throwIfProcessFailed(
    ProcessResult pr,
    String process,
    List<String> args,
  ) {
    if (pr.exitCode != 0) {
      final values = {'Standard out': pr.stdout.toString().trim(), 'Standard error': pr.stderr.toString().trim()}
        ..removeWhere((k, v) => v.isEmpty);

      String message;
      if (values.isEmpty) {
        message = 'Unknown error';
      } else if (values.length == 1) {
        message = values.values.single;
      } else {
        message = values.entries.map((e) => '${e.key}\n${e.value}').join('\n');
      }

      throw ProcessException(process, args, message, pr.exitCode);
    }
  }
}
