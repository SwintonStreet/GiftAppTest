import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: const Center(child: Text('This is the About Me page.')),
    );
  }
}
