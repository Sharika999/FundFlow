import 'package:flutter/material.dart';

class CreateGroupPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Group'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Enter phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simulate sending an invitation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Invitation sent to ${phoneController.text}!')),
                );
              },
              child: const Text('Send Invitation'),
            ),
          ],
        ),
      ),
    );
  }
}
