import 'package:flutter/material.dart';

class BrandsStrip extends StatelessWidget {
  const BrandsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _brands;
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Wrap(
            spacing: 28,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: items
                .map((b) => Opacity(
                      opacity: 0.7,
                      child: Text(
                        b,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

const _brands = <String>['Rajasthan Projects', 'Kesar Build', 'StoneCraft', 'GraniteCo', 'MarblePro'];


