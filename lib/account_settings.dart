import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: const Center(child: Text('Account Settings Page')),
    );
  }
}
