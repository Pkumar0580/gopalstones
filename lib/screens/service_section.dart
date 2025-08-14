import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../widgets/section_divider.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback:
                  (rect) => const LinearGradient(
                    colors: [Color(0xFFF59E0B), Color(0xFFFFD166)],
                  ).createShader(rect),
              child: Text(
                'Our Services',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SectionDivider(),
            const SizedBox(height: 32),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: AnimationLimiter(
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: List.generate(services.length, (index) {
                    final service = services[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: ServiceCard(
                            icon: service['icon'],
                            title: service['title'],
                            description: service['description'],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ServiceCard same rahega

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.grey.shade50],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF7E5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 28,
                  color: Color(0xFFF59E0B),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Services data list (expanded)
const List<Map<String, dynamic>> services = [
  {
    'icon': Icons.cut,
    'title': 'Stone Cutting',
    'description':
        'Precision cutting for sandstone, limestone, and tiles with exact sizing.',
  },
  {
    'icon': Icons.texture,
    'title': 'Marble Cutting',
    'description':
        'Marble slab sizing, edge finishing, and polish-ready finishing.',
  },
  {
    'icon': Icons.grid_view,
    'title': 'Granite Cutting',
    'description':
        'Granite for kitchen tops, stairs, and exterior with durable finishes.',
  },
  {
    'icon': Icons.build,
    'title': 'Installation',
    'description':
        'Experienced on-site installation for flooring, countertops, and cladding.',
  },
  {
    'icon': Icons.door_front_door,
    'title': 'Door Frame',
    'description':
        'Custom door frames in marble/granite with clean edges and strong joints.',
  },
  {
    'icon': Icons.window,
    'title': 'Window Frame',
    'description': 'Window cills and frames measured and cut to perfection.',
  },
  {
    'icon': Icons.design_services,
    'title': 'Custom Design',
    'description':
        'Temple work, skirting, borders, and bespoke stone detailing.',
  },
];
