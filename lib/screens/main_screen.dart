import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'footer_section.dart';
import 'gallery_section.dart';
import 'hero_section.dart';
import 'service_section.dart';
import 'products_section.dart';
import '../widgets/section_divider.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/brands_strip.dart';

class MainScreen extends StatefulWidget {
  final String? initialSection; // 'about' | 'services' | 'gallery' | 'contact'
  const MainScreen({super.key, this.initialSection});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int _activeIndex = 0;
  bool _showBackToTop = false;
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    // Delay to ensure widgets are laid out before scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialSection != null) {
        final map = {'about': 1, 'services': 2, 'gallery': 3, 'contact': 4};
        final index = map[widget.initialSection!];
        if (index != null) {
          _scrollToSection(index);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    Scrollable.ensureVisible(
      _sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launchUrl(String url) async {
    final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
    final uri = Uri.parse(url);
    final can = await canLaunchUrl(uri);
    if (!mounted) return;
    if (can) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      scaffoldMessenger?.showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final max = position.maxScrollExtent == 0 ? 1 : position.maxScrollExtent;
    final progress = (position.pixels / max).clamp(0.0, 1.0);

    _updateActiveSection();

    final shouldShowBackToTop = position.pixels > 300;

    if (_scrollProgress != progress || _showBackToTop != shouldShowBackToTop) {
      setState(() {
        _scrollProgress = progress;
        _showBackToTop = shouldShowBackToTop;
      });
    }
  }

  void _updateActiveSection() {
    // Determine which section header is closest to the top of the viewport
    int closestIndex = 0;
    double closestDistance = double.infinity;

    final double viewportTop =
        MediaQuery.of(context).padding.top + kToolbarHeight + 8;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx == null) continue;
      final render = ctx.findRenderObject();
      if (render is! RenderBox) continue;

      final offset = render.localToGlobal(Offset.zero).dy;
      final distance = (offset - viewportTop).abs();
      if (distance < closestDistance) {
        closestDistance = distance;
        closestIndex = i;
      }
    }

    if (_activeIndex != closestIndex) {
      setState(() {
        _activeIndex = closestIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 670;

    final bool isScrolled = _scrollProgress > 0.02;

    return Scaffold(
      drawer:
          isSmallScreen
              ? Drawer(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2C3E50), Color(0xFF34495E)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: const SizedBox.shrink(),
                        ),
                      ),
                      _buildDrawerItem(
                        icon: Icons.home,
                        label: 'Home',
                        onTap: () {
                          Navigator.pop(context);
                          context.go('/');
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.info,
                        label: 'About',
                        onTap: () {
                          Navigator.pop(context);
                          context.go('/about');
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.build,
                        label: 'Services',
                        onTap: () {
                          Navigator.pop(context);
                          context.go('/services');
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.photo_library,
                        label: 'Gallery',
                        onTap: () {
                          Navigator.pop(context);
                          context.go('/gallery');
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.contact_mail,
                        label: 'Contact',
                        onTap: () {
                          Navigator.pop(context);
                          context.go('/contact');
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.storefront,
                        label: 'Products',
                        onTap: () {
                          Navigator.pop(context);
                          context.go('/products');
                        },
                      ),
                      const Divider(color: Colors.white24),
                      ListTile(
                        leading: const Icon(Icons.call, color: Colors.white),
                        title: const Text(
                          'Call Now',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => _launchUrl('tel:+919785550244'),
                      ),
                      ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'WhatsApp',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => _launchUrl('https://wa.me/919785550244'),
                      ),
                    ],
                  ),
                ),
              )
              : null,

      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: isScrolled ? 4 : 2,
            forceElevated: true,
            iconTheme: const IconThemeData(color: Colors.black87),
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset('assets/logo1.png', height: 28),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Shri Gopal Stones',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            actions:
                isSmallScreen
                    ? null
                    : [
                      _NavButton(
                        label: 'Home',
                        isActive: _activeIndex == 0,
                        onTap: () => context.go('/'),
                      ),
                      _NavButton(
                        label: 'About',
                        isActive: _activeIndex == 1,
                        onTap: () => context.go('/about'),
                      ),
                      _NavButton(
                        label: 'Services',
                        isActive: _activeIndex == 2,
                        onTap: () => context.go('/services'),
                      ),
                      _NavButton(
                        label: 'Gallery',
                        isActive: _activeIndex == 3,
                        onTap: () => context.go('/gallery'),
                      ),
                      _NavButton(
                        label: 'Contact',
                        isActive: _activeIndex == 4,
                        onTap: () => context.go('/contact'),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ElevatedButton(
                          onPressed: () => _scrollToSection(4),
                          child: const Text('Get a Quote'),
                        ),
                      ),
                    ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(3),
              child: LinearProgressIndicator(
                value: _scrollProgress,
                minHeight: 3,
                backgroundColor: Colors.black12,
                valueColor: const AlwaysStoppedAnimation(Color(0xFFF59E0B)),
              ),
            ),
          ),
          SliverToBoxAdapter(child: HeroSection(sectionKeys: _sectionKeys)),
          SliverToBoxAdapter(child: AboutSection(key: _sectionKeys[1])),
          const SliverToBoxAdapter(child: SectionDivider()),
          const SliverToBoxAdapter(child: ProductsSection()),
          const SliverToBoxAdapter(child: SectionDivider()),
          SliverToBoxAdapter(child: ServicesSection(key: _sectionKeys[2])),
          const SliverToBoxAdapter(child: SectionDivider()),
          const SliverToBoxAdapter(child: BrandsStrip()),
          const SliverToBoxAdapter(child: SectionDivider()),
          SliverToBoxAdapter(child: GallerySection(key: _sectionKeys[3])),
          const SliverToBoxAdapter(child: SectionDivider()),
          const SliverToBoxAdapter(child: TestimonialsSection()),
          const SliverToBoxAdapter(child: SectionDivider()),
          SliverToBoxAdapter(child: ContactSection(key: _sectionKeys[4])),
          const SliverToBoxAdapter(child: CustomFooter()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSlide(
            duration: const Duration(milliseconds: 200),
            offset: _showBackToTop ? Offset.zero : const Offset(0, 0.5),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _showBackToTop ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: FloatingActionButton.small(
                  heroTag: 'toTop',
                  backgroundColor: const Color(0xFF374151),
                  onPressed: () {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_upward, color: Colors.white),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            heroTag: 'wa',
            backgroundColor: const Color(0xFF22C55E),
            onPressed: () => _launchUrl('https://wa.me/919785550244'),
            child: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

Widget _buildDrawerItem({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    hoverColor: Colors.white24,
    onTap: onTap,
  );
}

class _NavButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? Colors.white12 : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border(
              bottom: BorderSide(
                color: isActive ? const Color(0xFFF59E0B) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
