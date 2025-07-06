import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'friends_page.dart';
import 'group_page.dart';
import 'add_new_item.dart';

class WishlistsPage extends StatelessWidget {
  const WishlistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlists'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: const SizedBox.expand(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Wishlists',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 56, 8),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.add, size: 32, color: Colors.white),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 2, // Center selected by default
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistsPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FriendsPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddNewItemPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GroupPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              break;
          }
        },
      ),
    );
  }
}
