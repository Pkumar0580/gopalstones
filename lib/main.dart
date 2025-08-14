import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'routes/app_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'theme/app_theme.dart';

void main() {
  // Use path-based URLs on the web (no #)
  usePathUrlStrategy();
  runApp(MyWebApp());
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = createRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Shri Gopal Stones',
      scrollBehavior: const _AppScrollBehavior(),
      theme: AppTheme.buildTheme().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: router,
    );
  }
}

class _AppScrollBehavior extends MaterialScrollBehavior {
  const _AppScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    // Smooth, platform-appropriate scrolling with no overscroll glow on web/desktop.
    return const ClampingScrollPhysics();
  }

  @override
  Set<PointerDeviceKind> get dragDevices => const {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}
