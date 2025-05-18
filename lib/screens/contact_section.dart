import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
        child: Column(
          children: [
            Text(
              'Get in Touch',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
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

                      const SizedBox(height: 16),
                      const Text('Phone: +91-9785550244'),
                      const Text('Email: Shrigopalstones@gmail.com'),
                      const Text('GST: 08AKFPK7179M1ZG'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
