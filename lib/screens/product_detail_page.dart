import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String slug;
  const ProductDetailPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final product = _resolveProduct(slug);
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children:
                        product.specs.map((s) => Chip(label: Text(s))).toList(),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Get Quote'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailData {
  final String title;
  final String description;
  final String image;
  final List<String> specs;
  const ProductDetailData({
    required this.title,
    required this.description,
    required this.image,
    required this.specs,
  });
}

ProductDetailData _resolveProduct(String slug) {
  switch (slug) {
    case 'granite-countertop':
      return const ProductDetailData(
        title: 'Granite Countertop',
        description:
            'High-quality granite countertops with polished finish, ideal for kitchens and bathrooms. Resistant to heat and scratches.',
        image: 'assets/work1.webp',
        specs: ['Thickness: 20mm', 'Finish: Polished', 'Color: Black Galaxy'],
      );
    case 'marble-flooring':
      return const ProductDetailData(
        title: 'Marble Flooring',
        description:
            'Elegant marble slabs that add luxury and timeless beauty to any space. Precision cut for seamless installation.',
        image: 'assets/work2.webp',
        specs: ['Thickness: 18mm', 'Finish: Honed', 'Color: Carrara'],
      );
    case 'sandstone-tiles':
      return const ProductDetailData(
        title: 'Sandstone Tiles',
        description:
            'Durable sandstone tiles with natural textures suitable for outdoors and high-traffic areas.',
        image: 'assets/business.webp',
        specs: ['Size: 600x600', 'Finish: Natural', 'Color: Desert Tan'],
      );
    default:
      return const ProductDetailData(
        title: 'Product',
        description: 'Details coming soon.',
        image: 'assets/business.webp',
        specs: ['Quality Assured', 'Custom Sizes', 'Fast Delivery'],
      );
  }
}
