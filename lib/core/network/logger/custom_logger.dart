import 'package:logger/logger.dart';

enum LogLevel { trace, debug, info, warning, error, fatal }

class CustomLogger {
  final Logger _logger;

  CustomLogger({LogLevel level = LogLevel.trace})
    : _logger = Logger(
        printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, lineLength: 100, colors: true, printEmojis: true),
        level: _mapLogLevel(level),
      );

  static Level _mapLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.trace:
        return Level.trace;
      case LogLevel.debug:
        return Level.debug;
      case LogLevel.info:
        return Level.info;
      case LogLevel.warning:
        return Level.warning;
      case LogLevel.error:
        return Level.error;
      case LogLevel.fatal:
        return Level.fatal;
    }
  }

  void trace(String message) => _logger.v(message);
  void debug(String message) => _logger.d(message);
  void info(String message) => _logger.i(message);
  void warning(String message) => _logger.w(message);
  void error(String message, [Object? error, StackTrace? stackTrace]) => _logger.e(message, error: error, stackTrace: stackTrace);
  void fatal(String message, [Object? error, StackTrace? stackTrace]) => _logger.f(message, error: error, stackTrace: stackTrace);
}
