import 'package:interact_cli/interact_cli.dart';
// ignore: implementation_imports
import 'package:interact_cli/src/framework/framework.dart';
import 'package:tint/tint.dart';

export 'package:tint/tint.dart';

class Console {
  LogLevel _level;
  final Context _context;

  final List<String> _queue = [];

  Console({LogLevel level = LogLevel.info})
      : _level = level,
        _context = Context();
  static int spacing = 3;
  static String space = ' ' * spacing;
  static Theme theme = Theme.colorfulTheme.copyWith(
    successPrefix: '◆'.padRight(spacing).green(),
    successSuffix: '✔'.padRight(2).green(),
    errorPrefix: '■'.padRight(spacing).red(),
    inputPrefix: '?'.padRight(spacing).green(),
    checkedItemPrefix: '◉'.padLeft(spacing + 1).brightGreen(),
    uncheckedItemPrefix: '◯'.padLeft(spacing + 1).green().dim(),
    activeItemPrefix: '❯'.padLeft(spacing + 1).brightGreen(),
    inactiveItemPrefix: ' '.padLeft(spacing + 1).green(),
    messageStyle: (m) => m.white(),
    activeItemStyle: (m) => m.brightGreen(),
    inactiveItemStyle: (m) => m.grey(),
    valueStyle: (x) => x.green(),
    defaultStyle: (x) => x.cyan(),
    hintStyle: (m) => m.gray(),
    spinners: [
      '⬖',
      '⬘',
      '⬗',
      '⬙',
      '⬖',
      '⬘',
      '⬗',
      '⬙',
      '⬖',
      '⬘',
    ].map((e) => e.padRight(spacing).cyan()).toList(),
    spinningInterval: 80,
  );
  String get linePrefixVertical => '│'.padRight(spacing).gray();
  String get linePrefixStart => '┌'.padRight(spacing).gray();
  String get linePrefixEnd => '└'.padRight(spacing).gray();
  String get linePrefixDiamond => ('◇').padRight(spacing).green();
  String get linePrefixUsage => ('◇').padRight(spacing).green();
  String get linePrefixError => '■'.padRight(spacing).red();

  String get linePrefixTraceStart => '•'.padRight(spacing).cyan();
  String get linePrefixTraceItem => '▹'.padRight(spacing).cyan().dim();

  String get linePrefixT => '├'.padRight(spacing).gray();

  // String get linePrefixHorizontal => darkGray.wrap('─')!;
  // String get linePrefixCorner => darkGray.wrap('┌')!;
  // // String get linePrefixCornerEnd => '┐';
  // String get linePrefixCornerBottom => darkGray.wrap('└')!;
  // // String get linePrefixCornerBottomEnd => '┘';
  // String get linePrefixT => '├';
  // // String get linePrefixTBottom => '┴';
  // // String get linePrefixTTop => '┬';
  // String get linePrefixDiamond => green.wrap('◇')!;
  // String get linePrefixSuccess => green.wrap('◆')!;
  // String get linePrefixFail => red.wrap('■')!;
  // String get spacing => ' ' * 3;

  set level(LogLevel level) {
    _level = level;
  }

  void info(String? message) {
    if (_level.index <= LogLevel.info.index) {
      _context.writeln('$message');
    }
  }

  void infoStyled(String? message) {
    if (message == null) return;
    final sb = StringBuffer();
    final lines = message.split('\n');
    for (final line in lines) {
      if (lines.indexOf(line) == 0) {
        sb.write(linePrefixDiamond);
        sb.write(line.gray());
      } else {
        sb.write(linePrefixVertical);
        sb.write(line.grey());
      }
      sb.write('\n');
    }
    _context.write(sb.toString());
  }

  void warning(String? message) {
    if (_level.index <= LogLevel.warning.index) {
      _context.writeln('$message');
    }
  }

  void error(String? message) {
    if (_level.index <= LogLevel.error.index) {
      _context.writeln('$message');
    }
  }

  void errorStyled(String message) {
    final sb = StringBuffer();
    final lines = message.split('\n');
    for (final line in lines) {
      if (lines.indexOf(line) == 0) {
        sb.write(linePrefixError);
        // sb.write('∴'.padRight(3).red().bold());
        sb.write(line.red());
      } else {
        sb.write(linePrefixVertical);
        sb.write(line.grey());
      }
      sb.write('\n');
    }
    _context.write(sb.toString());
  }

  void fatal(String? message, {Object? error, StackTrace? stackTrace}) {
    if (_level.index <= LogLevel.fatal.index) {
      final sb = StringBuffer();

      sb.write('$message');
      if (error != null) {
        sb.write(' $error');
      }
      _context.writeln(sb.toString());
    }
  }

  void fatalLine(String? message, {Object? error, StackTrace? stackTrace}) {
    final sb = StringBuffer();
    sb.write('$message');
    if (error != null) {
      sb.write(' $error');
    }
    _context.write(linePrefixError);
    _context.write(sb.toString().red());
  }

  void write(String message) {
    _context.write(message);
  }

  void trace(String message) {
    _queue.add(message);
  }

  void flush() {
    if (_level.index > LogLevel.verbose.index) return;
    _context.writeln(linePrefixVertical.gray());
    _context.write(linePrefixTraceStart);
    _context.writeln('Trace messages [${_queue.length}] '.cyan());
    _context.writeln(linePrefixVertical.gray());
    for (final message in _queue) {
      final lines = message.split('\n');
      for (final line in lines) {
        final prefix = lines.indexOf(line) == 0 ? linePrefixTraceItem : linePrefixVertical;
        _context.write(prefix.gray());
        _context.write(line.gray().dim());
        _context.write('\n');
      }
      _context.writeln(linePrefixVertical.gray().dim());
    }
    _queue.clear();
  }

  void clearScreen() {
    _context.writeln('\x1B[2J\x1B[H');
  }

  void start(String title, {String? message}) {
    final sb = StringBuffer();
    sb.write(theme.hintStyle('┌'));
    sb.write(' ' * (spacing - 1));
    sb.write(' $title '.onGreen().white());
    if (message != null) {
      sb.write(' ');
      sb.write(theme.hintStyle(message));
    }
    _context.writeln(sb.toString());
    verticalLine();
  }

  void end(String title, {String? message}) {
    final sb = StringBuffer();
    sb.write(theme.hintStyle('└'));
    sb.write(' ' * (spacing - 1));
    sb.write(' $title '.onGray().white());
    if (message != null) {
      sb.write(' ');
      sb.write(theme.hintStyle(message));
    }
    verticalLine();
    _context.writeln(sb.toString());
  }

  void section(String title, {String? message}) {
    final sb = StringBuffer();
    sb.write(theme.hintStyle('├'));
    sb.write(' ' * (spacing - 1));
    sb.write(' $title '.onCyan().white());
    if (message != null) {
      sb.write(' ');
      sb.write(theme.hintStyle(message));
    }
    verticalLine();
    _context.writeln(sb.toString());
  }

  void newLine() {
    _context.writeln(' ');
  }

  void verticalLine() {
    _context.writeln(linePrefixVertical);
  }

  void detailStyled(String message, {bool verticalLine = false}) {
    if (_level.index > LogLevel.verbose.index) return;
    final sb = StringBuffer();
    if (verticalLine) {
      sb.write(theme.hintStyle(linePrefixVertical));
      sb.write(' ' * spacing);
    }
    sb.write(theme.hintStyle(message));
    _context.writeln(sb.toString());
  }

  /// Constructs an [Input] component with the supplied theme.
  String prompt(
    String prompt, {
    bool Function(String)? validator,
    String initialText = '',
    String? defaultValue,
  }) =>
      Input.withTheme(
              theme: theme, prompt: prompt, validator: validator, initialText: initialText, defaultValue: defaultValue)
          .interact();

  /// Constructs a [Password] component with the supplied theme.
  String password(
    String prompt, {
    bool confirmation = false,
    String? confirmPrompt,
    String? confirmError,
  }) =>
      Password.withTheme(
              theme: theme,
              prompt: prompt,
              confirmation: confirmation,
              confirmPrompt: confirmPrompt,
              confirmError: confirmError)
          .interact();

  /// Constructs a [Confirm] component with the supplied theme.
  bool confirm(
    String prompt, {
    bool? defaultValue,
    bool waitForNewLine = false,
  }) =>
      Confirm.withTheme(theme: theme, prompt: prompt, defaultValue: defaultValue, waitForNewLine: waitForNewLine)
          .interact();

  /// Constructs a [Select] component with the supplied theme.
  T select<T>(
    String prompt, {
    required List<T> options,
    T? defaultValue,
    required String Function(T) display,
  }) {
    final result = Select.withTheme(
      theme: theme,
      prompt: prompt,
      options: options.map(display).toList(),
      initialIndex: defaultValue != null ? options.indexOf(defaultValue) : 0,
    ).interact();
    return options[result];
  }

  /// Constructs a [MultiSelect] component with the supplied theme.
  List<T> multiSelect<T>(
    String prompt, {
    required List<T> options,
    List<T>? defaultValues,
    required String Function(T) display,
  }) {
    final result = MultiSelect.withTheme(
      theme: theme,
      prompt: prompt,
      options: options.map(display).toList(),
      defaults: defaultValues != null ? options.map((e) => defaultValues.contains(e)).toList() : null,
    ).interact();
    return result.map((index) => options[index]).toList();
  }

  /// Constructs a [Spinner2] component with the supplied theme.
  Spinner2State progress(
    String prompt, {
    String? successMessage,
    String? failedMessage,
    bool clear = false,
  }) =>
      Spinner2.withTheme(
        prompt: prompt,
        theme: theme,
        icon: theme.successPrefix,
        failedIcon: theme.errorPrefix,
        clear: clear,
      ).interact();

  Future<void> task(
    String prompt, {
    required Future<void> Function(Spinner2State spinner) task,
    String? successMessage,
    String? failedMessage,
    bool clear = false,
  }) async {
    final spinner = Spinner2.withTheme(
      prompt: prompt,
      theme: theme,
      icon: theme.successPrefix,
      failedIcon: theme.errorPrefix,
      clear: clear,
    ).interact();
    try {
      final result = await task(spinner);

      spinner.success(successMessage);
      return result;
    } catch (e) {
      spinner.failed(failedMessage);
    }
  }
}

enum LogLevel {
  verbose,
  info,
  warning,
  error,
  fatal,
}
