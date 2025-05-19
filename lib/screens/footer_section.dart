// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class FooterSection extends StatelessWidget {
//   const FooterSection({super.key});

//   Future<void> _launchUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text('Could not launch $url')),
//       // );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF1F2937),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           const Text(
//             '© 2025 Shri Gopal Stones. All rights reserved.',
//             style: TextStyle(color: Colors.white),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Phone: +91-9785550244 | Email: Shrigopalstones@gmail.com | GST: 08AKFPK7179M1ZG',
//             style: TextStyle(color: Colors.white),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Address: KHATU WALO KI DHANI, VPO-UDAIPURIA, TEH-CHOMU, Jaipur, Rajasthan, 303807',
//             style: TextStyle(color: Colors.white),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   FontAwesomeIcons.facebook,
//                   color: Colors.white,
//                 ),
//                 onPressed:
//                     () =>
//                         _launchUrl('https://www.facebook.com/shrigopalstones'),
//               ),
//               IconButton(
//                 icon: const Icon(
//                   FontAwesomeIcons.instagram,
//                   color: Colors.white,
//                 ),
//                 onPressed:
//                     () =>
//                         _launchUrl('https://www.instagram.com/shrigopalstones'),
//               ),
//               IconButton(
//                 icon: const Icon(
//                   FontAwesomeIcons.whatsapp,
//                   color: Colors.white,
//                 ),
//                 onPressed: () => _launchUrl('https://wa.me/1234567890'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class FooterSection extends StatelessWidget {
//   const FooterSection({super.key});

//   Future<void> _launchUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF1F2937),
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Center(
//             child: Text(
//               '© 2025 Shri Gopal Stones. All rights reserved.',
//               style: TextStyle(color: Colors.white, fontSize: 14),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             '📞 Phone: +91-9785550244',
//             style: TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             '✉️ Email: Shrigopalstones@gmail.com',
//             style: TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             '🧾 GST: 08AKFPK7179M1ZG',
//             style: TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             '📍 Address: KHATU WALO KI DHANI, VPO-UDAIPURIA,\nTEH-CHOMU, Jaipur, Rajasthan, 303807',
//             style: TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           const SizedBox(height: 20),
//           Center(
//             child: Wrap(
//               spacing: 16,
//               children: [
//                 IconButton(
//                   icon: const Icon(FontAwesomeIcons.facebook, color: Colors.white),
//                   onPressed: () => _launchUrl('https://www.facebook.com/shrigopalstones'),
//                 ),
//                 IconButton(
//                   icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
//                   onPressed: () => _launchUrl('https://www.instagram.com/shrigopalstones'),
//                 ),
//                 IconButton(
//                   icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
//                   onPressed: () => _launchUrl('https://wa.me/919785550244'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Business Name
          Text(
            'Shri Gopal Stone & Suppliers',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Contact Info
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 8,
            children: const [
              Text(
                'Phone: +91-9785550244',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                'Email: Shrigopalstones@gmail.com',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                'GST: 08AKFPK7179M1ZG',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Address
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Address: KHATU WALO KI DHANI, VPOUDAIPURIA, TEH-CHOMU, Jaipur, Rajasthan, 303807',
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 16),

          // Social Media (Placeholder icons)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.facebook, color: Colors.white70),
              ),

              const SizedBox(width: 12),
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.instagram, color: Colors.white70),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.white70),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Copyright
          const Text(
            '© 2025 Shrigopal Stones. All rights reserved.',
            style: TextStyle(color: Colors.white54, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
