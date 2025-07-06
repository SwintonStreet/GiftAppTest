import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: const Center(child: Text('Groups Page')),
    );
  }
}
