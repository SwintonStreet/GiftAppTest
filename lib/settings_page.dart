import 'package:flutter/material.dart';
import 'my_profile_page.dart';
import 'account_settings.dart';
import 'about_me.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Me'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutMePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Account Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login/Log Out'),
            onTap: () {
              // Add login/logout logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login/Log Out tapped')),
              );
            },
          ),
        ],
      ),
    );
  }
}
