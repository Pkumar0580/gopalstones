import 'package:flutter/material.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _testimonials;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text('What Our Clients Say', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: items.map((t) => _TestimonialCard(item: t)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final _Testimonial item;
  const _TestimonialCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.grey.shade300, child: Text(item.name[0])),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: Theme.of(context).textTheme.titleMedium),
                      Text(item.role, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text('“${item.quote}”', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _Testimonial {
  final String name;
  final String role;
  final String quote;

  const _Testimonial({required this.name, required this.role, required this.quote});
}

const _testimonials = <_Testimonial>[
  _Testimonial(
    name: 'Rahul Sharma',
    role: 'Architect',
    quote: 'Stone quality and finish were excellent. Installation was on time and precise.',
  ),
  _Testimonial(
    name: 'Neha Gupta',
    role: 'Homeowner',
    quote: 'Great experience from selection to fitting. Highly recommended!',
  ),
  _Testimonial(
    name: 'Amit Verma',
    role: 'Builder',
    quote: 'Consistent supply and professional cutting services for our projects.',
  ),
];


