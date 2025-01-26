import 'package:flutter/material.dart';
import 'pie_chart_view.dart'; // Ensure this file path is correct

class ExpenseTrackerPage extends StatelessWidget {
  const ExpenseTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Daily Spending: ₹500', style: TextStyle(fontSize: 18)),
            const Text('Monthly Spending: ₹15,000', style: TextStyle(fontSize: 18)),
            const Text('Yearly Spending: ₹1,80,000', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20), // Add spacing
            Expanded(
              child: Center(
                child: PieChartView(), // Add the PieChartView widget
              ),
            ),
          ],
        ),
      ),
    );
  }
}
