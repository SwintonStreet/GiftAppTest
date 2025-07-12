import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/default_profile.png',
                  ), // Placeholder
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.edit, size: 18),
                      onPressed: () {
                        // Add image picker logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Edit profile image')),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('First Name'),
            subtitle: const Text('John'), // Placeholder
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit First Name')),
                );
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Last Name'),
            subtitle: const Text('Doe'), // Placeholder
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Edit Last Name')));
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text('Date of Birth'),
            subtitle: const Text('01-01-2000'), // Placeholder
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit Date of Birth')),
                );
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.wc),
            title: const Text('Gender'),
            subtitle: const Text('Male'), // Placeholder
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Edit Gender')));
              },
            ),
          ),
        ],
      ),
    );
  }
}
