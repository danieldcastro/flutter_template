abstract class ILog {
  void debug(String message, [Object? error, StackTrace? stackTrace]);

  void info(String message, [Object? error, StackTrace? stackTrace]);

  void warning(String message, [Object? error, StackTrace? stackTrace]);

  void error(String message, [Object? error, StackTrace? stackTrace]);

  void append(String message);

  void closeAppend({bool information = true});
}
