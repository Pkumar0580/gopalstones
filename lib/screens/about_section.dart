// import 'package:flutter/material.dart';

// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       opacity: 1.0,
//       duration: const Duration(milliseconds: 1000),
//       child: Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 80),
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 800),
//             child: Column(
//               children: [
//                 Text(
//                   'About Us',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 const SizedBox(height: 32),
//                 Text(
//                   'At StoneCraft Designs, we specialize in high-quality stone cutting and custom door frame manufacturing. With years of experience and a passion for craftsmanship, we deliver durable and aesthetically pleasing solutions for homes and businesses.',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback:
                      (rect) => const LinearGradient(
                        colors: [Color(0xFFF59E0B), Color(0xFFFFD166)],
                      ).createShader(rect),
                  child: Text(
                    'About Shri Gopal Stones',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Shri Gopal Stones is a trusted name in the natural stone industry, known for supplying top-quality stones and providing expert stone cutting solutions. With years of experience and a deep-rooted commitment to excellence, we serve architects, builders, and homeowners with precision-crafted stone materials for both commercial and residential projects.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.7, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                Text(
                  'हम श्री गोपाल स्टोन्स में पत्थरों की आपूर्ति और कटिंग सेवाओं में विशेषज्ञ हैं। हमारे यहां मार्बल, ग्रेनाइट, सैंडस्टोन जैसी विभिन्न क्वालिटी स्टोन्स मिलते हैं, जो घरों, मंदिरों और कमर्शियल प्रोजेक्ट्स के लिए उपयुक्त हैं। हमारी अनुभवी टीम हर ऑर्डर को बारीकी से संभालती है ताकि हर ग्राहक को बेहतरीन परिणाम मिले।',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.7, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
