import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Conditions')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Terms & Conditions',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'By accessing or using Shri Gopal Stones, you agree to the following terms. All orders are subject to availability and confirmation. Prices are subject to change without notice. Any custom orders require advance payment. Delivery timelines are estimates and may vary. All disputes are subject to Jaipur jurisdiction.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
