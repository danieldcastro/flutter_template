import 'package:logger/logger.dart';

import 'i_log.dart';

class LogImpl implements ILog {
  LogImpl({Logger? logger}) : _logger = logger ?? Logger();

  final Logger _logger;
  final List<String> _messages = [];

  @override
  void append(String message) {
    _messages.add(message);
  }

  @override
  void closeAppend({bool information = true}) {
    if (_messages.isEmpty) return;

    final content = _messages.join('\n');

    if (information) {
      info(content);
    } else {
      warning(content);
    }

    _messages.clear();
  }

  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.d(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.i(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.w(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(
      message,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
