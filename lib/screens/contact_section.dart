// import 'package:flutter/material.dart';

// class ContactSection extends StatelessWidget {
//   const ContactSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController messageController = TextEditingController();

//     return AnimatedOpacity(
//       opacity: 1.0,
//       duration: const Duration(milliseconds: 1000),
//       child: Container(
//         color: Colors.grey[100],
//         padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
//         child: Column(
//           children: [
//             Text(
//               'Get in Touch',
//               style: Theme.of(
//                 context,
//               ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 48),
//             ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 500),
//               child: Card(
//                 color: Colors.white,
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(32.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       _buildTextField(
//                         controller: nameController,
//                         hintText: 'Your Name',
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField(
//                         controller: emailController,
//                         hintText: 'Your Email',
//                       ),
//                       const SizedBox(height: 16),
//                       _buildTextField(
//                         controller: messageController,
//                         hintText: 'Your Message',
//                         maxLines: 5,
//                       ),
//                       const SizedBox(height: 24),
//                       SizedBox(
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text(
//                                   'Message sent! We will get back to you soon.',
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.yellow[700],
//                             foregroundColor: Colors.black,
//                             textStyle: const TextStyle(fontSize: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: const Text('Send Message'),
//                         ),
//                       ),

//                       const SizedBox(height: 16),
//                       const Text('Phone: +91-9785550244'),
//                       const Text('Email: Shrigopalstones@gmail.com'),
//                       const Text('GST: 08AKFPK7179M1ZG'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     int maxLines = 1,
//   }) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hintText,
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 14,
//         ),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.grey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.yellow[700]!),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        child: Column(
          children: [
            Text(
              'Get in Touch',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            /// Input Form
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTextField(
                        controller: nameController,
                        hintText: 'Your Name',
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: emailController,
                        hintText: 'Your Email',
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: messageController,
                        hintText: 'Your Message',
                        maxLines: 5,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Message sent! We will get back to you soon.',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[700],
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Send Message'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// Contact Info + Map
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 700;
                  if (isNarrow) {
                    // Vertical layout: avoid Expanded to prevent unbounded height issues.
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          color: Colors.grey[900],
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 20,
                            ),
                            child: _ContactInfo(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(height: 260, child: _buildMap()),
                        ),
                      ],
                    );
                  } else {
                    // Horizontal layout: side-by-side with Expanded.
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.grey[900],
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 24,
                                horizontal: 20,
                              ),
                              child: _ContactInfo(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Give the map a fixed height; avoid stretching in unbounded height.
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(height: 260, child: _buildMap()),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    final bool isMobileOrWeb =
        kIsWeb ||
        defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;

    if (isMobileOrWeb) {
      return GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(26.9260, 75.7890),
          zoom: 10,
        ),
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        markers: {
          const Marker(
            markerId: MarkerId('office'),
            position: LatLng(26.9260, 75.7890),
            infoWindow: InfoWindow(
              title: 'Shri Gopal Stone & Supplier',
              snippet: 'Jaipur, Rajasthan',
            ),
          ),
        },
        liteModeEnabled: true,
        compassEnabled: false,
      );
    }

    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Text('Map preview not available on this platform'),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow[700]!),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _InfoRow(icon: Icons.call, text: '+91-9785550244'),
        SizedBox(height: 8),
        _InfoRow(icon: Icons.mail, text: 'Shrigopalstones@gmail.com'),
        SizedBox(height: 8),
        _InfoRow(icon: Icons.receipt_long, text: 'GST: 08AKFPK7179M1ZG'),
        SizedBox(height: 8),
        _InfoRow(
          icon: Icons.location_on,
          text:
              'KHATU WALO KI DHANI, VPO-UDAIPURIA, TEH-CHOMU, Jaipur, Rajasthan, 303807',
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
