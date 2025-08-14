import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = _demoProducts;
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 4 / 3,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return InkWell(
                  onTap: () => context.go('/products/${p.slug}'),
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            ),
                            child: Image.asset(
                              p.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                p.shortDescription,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ProductSummary {
  final String slug;
  final String name;
  final String shortDescription;
  final String image;

  const ProductSummary({
    required this.slug,
    required this.name,
    required this.shortDescription,
    required this.image,
  });
}

const _demoProducts = <ProductSummary>[
  ProductSummary(
    slug: 'granite-countertop',
    name: 'Granite Countertop',
    shortDescription: 'Premium polished granite for kitchens and baths.',
    image: 'assets/work1.webp',
  ),
  ProductSummary(
    slug: 'marble-flooring',
    name: 'Marble Flooring',
    shortDescription: 'Elegant marble slabs for luxury floors.',
    image: 'assets/work2.webp',
  ),
  ProductSummary(
    slug: 'sandstone-tiles',
    name: 'Sandstone Tiles',
    shortDescription: 'Durable and textured sandstone tiles.',
    image: 'assets/business.webp',
  ),
];
