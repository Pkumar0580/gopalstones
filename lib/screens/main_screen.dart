import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'footer_section.dart';
import 'gallery_section.dart';
import 'hero_section.dart';
import 'service_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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

  void _scrollToSection(int index) {
    Scrollable.ensureVisible(
      _sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 670;

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
                          child: const Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black45,
                                  blurRadius: 4,
                                  offset: Offset(1, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      _buildDrawerItem(
                        icon: Icons.home,
                        label: 'Home',
                        onTap: () {
                          Navigator.pop(context);
                          _scrollToSection(0);
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.info,
                        label: 'About',
                        onTap: () {
                          Navigator.pop(context);
                          _scrollToSection(1);
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.build,
                        label: 'Services',
                        onTap: () {
                          Navigator.pop(context);
                          _scrollToSection(2);
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.photo_library,
                        label: 'Gallery',
                        onTap: () {
                          Navigator.pop(context);
                          _scrollToSection(3);
                        },
                      ),
                      _buildDrawerItem(
                        icon: Icons.contact_mail,
                        label: 'Contact',
                        onTap: () {
                          Navigator.pop(context);
                          _scrollToSection(4);
                        },
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
            backgroundColor: Colors.grey[800],
            title: const Text(
              'Shree Gopal Stones',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions:
                isSmallScreen
                    ? null
                    : [
                      TextButton(
                        onPressed: () => _scrollToSection(0),
                        child: const Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _scrollToSection(1),
                        child: const Text(
                          'About',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _scrollToSection(2),
                        child: const Text(
                          'Services',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _scrollToSection(3),
                        child: const Text(
                          'Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _scrollToSection(4),
                        child: const Text(
                          'Contact',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                    ],
          ),
          SliverToBoxAdapter(child: HeroSection(sectionKeys: _sectionKeys)),
          SliverToBoxAdapter(child: AboutSection(key: _sectionKeys[1])),
          SliverToBoxAdapter(child: ServicesSection(key: _sectionKeys[2])),
          SliverToBoxAdapter(child: GallerySection(key: _sectionKeys[3])),
          SliverToBoxAdapter(child: ContactSection(key: _sectionKeys[4])),
          const SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF22C55E),
        onPressed: () => _launchUrl('https://wa.me/9785550244'),
        child: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
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
