import 'package:flutter/material.dart';

class SharedWalletPage extends StatelessWidget {
  const SharedWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Group Wallet'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Total Balance: \$100.00', // Example balance
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Transaction 1'),
                    subtitle: const Text('Description of transaction 1'),
                    trailing: const Text('-\$20.00'),
                  ),
                  ListTile(
                    title: const Text('Transaction 2'),
                    subtitle: const Text('Description of transaction 2'),
                    trailing: const Text('+ \$50.00'),
                  ),
                  // Add more transactions as needed
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to add a new transaction
              },
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
