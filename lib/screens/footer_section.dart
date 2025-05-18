import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Could not launch $url')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1F2937),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            '© 2025 Shri Gopal Stones. All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            'Phone: +91-9785550244 | Email: Shrigopalstones@gmail.com | GST: 08AKFPK7179M1ZG',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            'Address: KHATU WALO KI DHANI, VPO-UDAIPURIA, TEH-CHOMU, Jaipur, Rajasthan, 303807',
            style: TextStyle(color: Colors.white),
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
                onPressed:
                    () =>
                        _launchUrl('https://www.facebook.com/shrigopalstones'),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
                onPressed:
                    () =>
                        _launchUrl('https://www.instagram.com/shrigopalstones'),
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                ),
                onPressed: () => _launchUrl('https://wa.me/1234567890'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
