import 'package:flutter/material.dart';
import 'add_new_wishlist.dart';

class AddNewItemPage extends StatefulWidget {
  const AddNewItemPage({super.key});

  @override
  State<AddNewItemPage> createState() => _AddNewItemPageState();
}

class _AddNewItemPageState extends State<AddNewItemPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedCurrency;
  ImageProvider? itemImage;
  String? selectedWishlist;
  final List<String> wishlists = [
    'Birthday Gifts',
    'Christmas',
    'Anniversary',
    'Create New Wishlist',
  ];

  void pickImage() async {
    // TODO: Integrate image_picker for real photo selection
    setState(() {
      itemImage = const AssetImage('assets/default_item.png');
    });
  }

  void selectWishlist() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Select Wishlist'),
        children: wishlists.map((wishlist) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, wishlist),
            child: Text(wishlist),
          );
        }).toList(),
      ),
    );
    if (!mounted) return;
    if (result != null) {
      setState(() {
        selectedWishlist = result;
      });
      if (result == 'Create New Wishlist') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddNewWishlistPage()),
        );
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
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
                backgroundImage: itemImage,
                child: itemImage == null
                    ? const Icon(Icons.camera_alt, size: 40)
                    : null,
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 120,
                  child: DropdownButtonFormField<String>(
                    value: selectedCurrency,
                    decoration: const InputDecoration(
                      labelText: 'Currency',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'USD', child: Text('USD')),
                      DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                      DropdownMenuItem(value: 'GBP', child: Text('GBP')),
                      DropdownMenuItem(value: 'JPY', child: Text('JPY')),
                      DropdownMenuItem(value: 'CAD', child: Text('CAD')),
                    ],
                    onChanged: (value) =>
                        setState(() => selectedCurrency = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Add to Wishlist'),
              subtitle: Text(selectedWishlist ?? 'Select a wishlist'),
              trailing: const Icon(Icons.arrow_drop_down),
              onTap: selectWishlist,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add save logic here
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Item added!')));
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
