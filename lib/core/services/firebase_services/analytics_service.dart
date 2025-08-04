import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:logger/logger.dart';

class AnalyticsEventNames {
  static const String favoriteMovie = 'favorite_movie';
  static const String unfavoriteMovie = 'unfavorite_movie';
  static const String login = 'login';
  static const String register = 'register';
}

abstract class AnalyticsService {
  Future<void> logEvent(String name, {Map<String, Object?>? parameters});
  Future<void> setUserId(String? userId);
  Future<void> setUserProperty(String name, String value);
  Future<void> setCurrentScreen(String screenName);
}

class FirebaseAnalyticsService implements AnalyticsService {
  static final FirebaseAnalyticsService _instance = FirebaseAnalyticsService._internal();

  factory FirebaseAnalyticsService() {
    return _instance;
  }

  FirebaseAnalyticsService._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final Logger _logger = Logger();

  FirebaseAnalyticsObserver get observer => FirebaseAnalyticsObserver(analytics: _analytics);

  @override
  Future<void> logEvent(String name, {Map<String, Object?>? parameters}) async {
    try {
      final safeParams = parameters?.map((k, v) => MapEntry(k, v ?? '')) ?? {};
      await _analytics.logEvent(name: name, parameters: safeParams);
      _logger.i('Logged event: $name, params: $parameters');
    } catch (e) {
      _logger.e('Failed to log event: $name');
    }
  }

  @override
  Future<void> setUserId(String? userId) async {
    try {
      await _analytics.setUserId(id: userId);
      _logger.i('Set userId: $userId');
    } catch (e) {
      _logger.e('Failed to set userId: $userId');
    }
  }

  @override
  Future<void> setUserProperty(String name, String value) async {
    try {
      await _analytics.setUserProperty(name: name, value: value);
      _logger.i('Set userProperty: $name -> $value');
    } catch (e) {
      _logger.e('Failed to set userProperty: $name');
    }
  }

  @override
  Future<void> setCurrentScreen(String screenName) async {
    try {
      await _analytics.setCurrentScreen(screenName: screenName);
      _logger.i('Set current screen: $screenName');
    } catch (e) {
      _logger.e('Failed to set current screen: $screenName');
    }
  }
}
