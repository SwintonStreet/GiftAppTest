import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  String email = 'user@email.com';
  String password = 'password123';

  void editField({
    required String title,
    required String initialValue,
    required bool obscure,
    required Function(String) onSave,
  }) {
    final controller = TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $title'),
        content: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(labelText: title),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(email),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                editField(
                  title: 'Email',
                  initialValue: email,
                  obscure: false,
                  onSave: (val) => setState(() => email = val),
                );
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Password'),
            subtitle: Text('*' * password.length),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                editField(
                  title: 'Password',
                  initialValue: password,
                  obscure: true,
                  onSave: (val) => setState(() => password = val),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // Add delete logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account deleted!')),
                );
              },
              child: const Text('Delete Account'),
            ),
          ),
        ],
      ),
    );
  }
}
