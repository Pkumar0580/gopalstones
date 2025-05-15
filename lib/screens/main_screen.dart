import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            actions: [
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
    );
  }
}
