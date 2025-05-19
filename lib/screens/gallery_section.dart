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
                children:
                    images.map((image) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.zoomIn,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          transform: Matrix4.identity(),
                          child: SizedBox(
                            width: 300,
                            child: Card(
                              elevation: 4,
                              child: Image.asset(image, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[300],
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
