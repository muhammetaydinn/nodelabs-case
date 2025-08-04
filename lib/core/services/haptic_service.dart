import 'dart:io' show Platform;
import 'package:flutter/services.dart';

class HapticService {
  HapticService._();

  static Future<void> lightImpact() async {
    if (Platform.isIOS) {
      await HapticFeedback.lightImpact();
    } else if (Platform.isAndroid) {
      await HapticFeedback.lightImpact();
    } else {
      await HapticFeedback.vibrate();
    }
  }

  static Future<void> mediumImpact() async {
    if (Platform.isIOS) {
      await HapticFeedback.mediumImpact();
    } else if (Platform.isAndroid) {
      await HapticFeedback.mediumImpact();
    } else {
      await HapticFeedback.vibrate();
    }
  }

  static Future<void> heavyImpact() async {
    if (Platform.isIOS) {
      await HapticFeedback.heavyImpact();
    } else if (Platform.isAndroid) {
      await HapticFeedback.heavyImpact();
    } else {
      await HapticFeedback.vibrate();
    }
  }

  static Future<void> selectionClick() async {
    if (Platform.isIOS) {
      await HapticFeedback.selectionClick();
    } else if (Platform.isAndroid) {
      await HapticFeedback.selectionClick();
    } else {
      await HapticFeedback.vibrate();
    }
  }

  static Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }
}
