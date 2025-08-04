import 'package:go_router/go_router.dart';
import 'package:shartflix/core/network/dependy_injection/injection.dart';
import 'package:shartflix/core/network/token_storage/token_storage.dart';
import 'package:shartflix/core/services/navigation_service.dart';
import 'package:shartflix/features/authentication/presentation/pages/login_page.dart';
import 'package:shartflix/features/home/presentation/pages/home_page.dart';

class AuthenticationService {
  AuthenticationService._();

  static final AuthenticationService _instance = AuthenticationService._();
  static AuthenticationService get instance => _instance;

  static Future<String> checkInitialAuthStatus() async {
    try {
      final String? accessToken = await getIt<TokenStorage>().getAccessToken();

      if (accessToken != null && accessToken.isNotEmpty) {
        return HomePage.path;
      } else {
        return LoginPage.path;
      }
    } catch (e) {
      return LoginPage.path;
    }
  }

  static Future<void> logout({String? reason}) async {
    try {
      await getIt<TokenStorage>().clearAllTokens();

      final context = rootNavigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.go(LoginPage.path);
      } else {}
    } catch (e) {
      print(e);
    }
  }

  static Future<void> handle401Unauthorized() async {
    await logout(reason: "401 Unauthorized - Token geçersiz");
  }

  static Future<bool> isAuthenticated() async {
    try {
      final String? token = await getIt<TokenStorage>().getAccessToken();
      final bool isAuth = token != null && token.isNotEmpty;
      return isAuth;
    } catch (e) {
      return false;
    }
  }

  static Future<void> handleSuccessfulLogin() async {
    try {
      final context = rootNavigatorKey.currentContext;
      if (context != null && context.mounted) {
        context.go(HomePage.path);
      } else {}
    } catch (e) {
      print(e);
    }
  }

  static Future<void> debugTokenInfo() async {
    try {
      final String? token = await getIt<TokenStorage>().getAccessToken();
      if (token != null) {
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
