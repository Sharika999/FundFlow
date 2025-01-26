import 'package:flutter/material.dart';
import 'shared_wallet.dart'; // Import the shared wallet page

class PreviousGroupsPage extends StatelessWidget {
  const PreviousGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Groups'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Group 1'),
            onTap: () {
              // Navigate to the shared wallet for this group
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SharedWalletPage()),
              );
            },
          ),
          // Add more groups as needed
        ],
      ),
    );
  }
}
