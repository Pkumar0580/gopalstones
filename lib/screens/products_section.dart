import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _productCategories;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Our Products',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: items
                    .map(
                      (p) => _HoverScale(
                        child: _ProductCard(
                          title: p.title,
                          image: p.image,
                          description: p.description,
                          onTap: () => context.go(p.link),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 32),
              FilledButton.tonal(
                onPressed: () => context.go('/products'),
                child: const Text('View All Products'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final VoidCallback onTap;

  const _ProductCard({
    required this.title,
    required this.image,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(image, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductCategory {
  final String title;
  final String image;
  final String description;
  final String link;

  const _ProductCategory({
    required this.title,
    required this.image,
    required this.description,
    required this.link,
  });
}

class _HoverScale extends StatefulWidget {
  final Widget child;
  const _HoverScale({required this.child});

  @override
  State<_HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<_HoverScale> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: widget.child,
      ),
    );
  }
}

const _productCategories = <_ProductCategory>[
  _ProductCategory(
    title: 'Granite',
    image: 'assets/work1.webp',
    description: 'Premium granite slabs and countertops in various finishes.',
    link: '/products/granite-countertop',
  ),
  _ProductCategory(
    title: 'Marble',
    image: 'assets/work2.webp',
    description: 'Elegant marble for flooring and wall cladding.',
    link: '/products/marble-flooring',
  ),
  _ProductCategory(
    title: 'Sandstone',
    image: 'assets/business.webp',
    description: 'Durable sandstone tiles for outdoor and indoor spaces.',
    link: '/products/sandstone-tiles',
  ),
];

