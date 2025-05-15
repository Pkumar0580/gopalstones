import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            '© 2025 StoneCraft Designs. All rights reserved.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await launchUrl(Uri.parse('https://www.facebook.com'));
                },
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await launchUrl(Uri.parse('https://www.instagram.com'));
                },
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await launchUrl(Uri.parse('https://wa.me/1234567890'));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
