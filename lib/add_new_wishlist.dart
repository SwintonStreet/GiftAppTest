import 'package:flutter/material.dart';

class AddNewWishlistPage extends StatefulWidget {
  const AddNewWishlistPage({super.key});

  @override
  State<AddNewWishlistPage> createState() => _AddNewWishlistPageState();
}

class _AddNewWishlistPageState extends State<AddNewWishlistPage> {
  final TextEditingController nameController = TextEditingController();
  String? selectedVisibility;
  ImageProvider? wishlistImage;

  void pickImage() async {
    // TODO: Integrate image_picker for real photo selection
    setState(() {
      wishlistImage = const AssetImage('assets/default_wishlist.png');
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Wishlist'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: wishlistImage,
                child: wishlistImage == null
                    ? const Icon(Icons.camera_alt, size: 40)
                    : null,
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Wishlist Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedVisibility,
              decoration: const InputDecoration(
                labelText: 'Visibility',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Public', child: Text('Public')),
                DropdownMenuItem(value: 'Private', child: Text('Private')),
              ],
              onChanged: (value) => setState(() => selectedVisibility = value),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add save logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Wishlist created!')),
                );
              },
              child: const Text('Create Wishlist'),
            ),
          ],
        ),
      ),
    );
  }
}
