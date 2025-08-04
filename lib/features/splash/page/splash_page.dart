import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_image_widgets.dart';
import '../../../core/design_system/custom_widgets/shartflix_scaffold.dart';
import '../../../generated/assets.gen.dart';
import '../../authentication/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  static const String name = '/SplashPage';
  static const String path = '/SplashPage';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        context.go(LoginPage.path);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShartflixScaffold(
      canPop: false,
      body: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: ShartflixImageWidget(
              assetPath: Assets.images.pngImages.sinflixSplashImage.path,
              fit: BoxFit.cover,
              height: MediaQuery.sizeOf(context).height,
            ),
          );
        },
      ),
    );
  }
}
