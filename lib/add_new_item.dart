import 'package:flutter/material.dart';

class AddNewItemPage extends StatelessWidget {
  const AddNewItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: const Center(child: Text('Add your new item here!')),
    );
  }
}
