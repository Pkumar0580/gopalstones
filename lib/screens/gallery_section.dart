import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/business.webp',
      'assets/work1.webp',
      'assets/work2.webp',
    ];

    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            Text('Our Work', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 48),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: images.map((image) {
                  return _GalleryTile(image: image);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryTile extends StatefulWidget {
  final String image;
  const _GalleryTile({required this.image});

  @override
  State<_GalleryTile> createState() => _GalleryTileState();
}

class _GalleryTileState extends State<_GalleryTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Stack(
          children: [
            SizedBox(
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(widget.image, fit: BoxFit.cover),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: _hover ? 1 : 0,
              child: Container(
                width: 300,
                height: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withValues(alpha: 0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
