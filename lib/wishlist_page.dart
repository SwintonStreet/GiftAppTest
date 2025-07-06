import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'friends_page.dart';
import 'group_page.dart';

class WishlistsPage extends StatelessWidget {
  const WishlistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlists'),
        backgroundColor: const Color.fromARGB(255, 172, 106, 8),
      ),
      body: Stack(
        children: [
          // Main content can go here if needed
          const SizedBox.expand(),
          // Overlapping circular + button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, // Overlap the nav bar at the bottom
            child: Center(
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 56, 8),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, size: 40, color: Colors.white),
                  onPressed: () {
                    // Add action for + button here
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Wishlists'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Friends'),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Placeholder for center
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Groups'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
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
