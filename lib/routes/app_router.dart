import 'package:go_router/go_router.dart';
import '../screens/main_screen.dart';
import '../screens/products_page.dart';
import '../screens/product_detail_page.dart';
import '../screens/terms_page.dart';
import '../screens/privacy_policy_page.dart';
import '../screens/not_found_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MainScreen(),
      ),
      // Section deep links map to MainScreen with an initial section
      GoRoute(path: '/home', redirect: (_, __) => '/'),
      GoRoute(
        path: '/about',
        name: 'about',
        builder: (context, state) => const MainScreen(initialSection: 'about'),
      ),
      GoRoute(
        path: '/services',
        name: 'services',
        builder:
            (context, state) => const MainScreen(initialSection: 'services'),
      ),
      GoRoute(
        path: '/gallery',
        name: 'gallery',
        builder:
            (context, state) => const MainScreen(initialSection: 'gallery'),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        builder:
            (context, state) => const MainScreen(initialSection: 'contact'),
      ),
      // Products
      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) => const ProductsPage(),
        routes: [
          GoRoute(
            path: ':slug',
            name: 'product-detail',
            builder: (context, state) {
              final slug = state.pathParameters['slug']!;
              return ProductDetailPage(slug: slug);
            },
          ),
        ],
      ),
      // Legal
      GoRoute(
        path: '/terms',
        name: 'terms',
        builder: (context, state) => const TermsPage(),
      ),
      GoRoute(
        path: '/privacy',
        name: 'privacy',
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
    debugLogDiagnostics: false,
    // urlPathStrategy: UrlPathStrategy.path,
  );
}
