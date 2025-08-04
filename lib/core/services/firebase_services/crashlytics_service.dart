import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsService {
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  static Future<void> initialize() async {
    FlutterError.onError = _crashlytics.recordFlutterFatalError;

    await _crashlytics.setCrashlyticsCollectionEnabled(true);
  }

  static Future<void> recordError(dynamic error, StackTrace? stackTrace, {String? reason}) async {
    await _crashlytics.recordError(error, stackTrace, reason: reason);
  }

  static Future<void> log(String message) async {
    await _crashlytics.log(message);
  }
}
