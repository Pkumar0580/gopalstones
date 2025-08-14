import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final List<GlobalKey> sectionKeys;

  const HeroSection({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      key: sectionKeys[0],
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/business.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.55),
              Colors.black.withValues(alpha: 0.35),
              Colors.black.withValues(alpha: 0.55),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [Color(0xFFF59E0B), Color(0xFFFFD166)],
                  ).createShader(rect),
                  child: Text(
                    'Shri Gopal Stone & Supplier',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.white, letterSpacing: 0.5),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Premium Granite, Marble, and Sandstone Solutions',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white70, height: 1.3),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _HeroCTA(
                      label: 'Get a Quote',
                      primary: true,
                      onTap: () {
                        Scrollable.ensureVisible(
                          sectionKeys[4].currentContext!,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    _HeroCTA(
                      label: 'View Products',
                      primary: false,
                      onTap: () {
                        Scrollable.ensureVisible(
                          sectionKeys[1].currentContext!,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroCTA extends StatefulWidget {
  final String label;
  final bool primary;
  final VoidCallback onTap;

  const _HeroCTA({required this.label, required this.primary, required this.onTap});

  @override
  State<_HeroCTA> createState() => _HeroCTAState();
}

class _HeroCTAState extends State<_HeroCTA> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    final child = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: widget.primary
            ? (_hover ? const Color(0xFFF59E0B) : const Color(0xFFF59E0B))
            : Colors.transparent,
        borderRadius: borderRadius,
        border: widget.primary
            ? null
            : Border.all(color: _hover ? Colors.white : Colors.white70),
        boxShadow: widget.primary && _hover
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Text(
        widget.label,
        style: TextStyle(
          color: widget.primary ? Colors.black : Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(onTap: widget.onTap, child: child),
    );
  }
}
