import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Expense & EMI Tracker',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalBalance = 15000.0;
  double emiAmount = 4500.0;
  
  List<Map<String, dynamic>> transactions = [
    {'title': 'Saman / Kirana', 'amount': -350.0, 'type': 'Expense'},
    {'title': 'Salary / Income', 'amount': 15000.0, 'type': 'Income'},
    {'title': 'Rahul (Udhaar Diya)', 'amount': -1000.0, 'type': 'Khata'},
  ];

  @override
  Widget build(BuildContext context) {
    bool isLowBalance = totalBalance < emiAmount;

    return Scaffold(
      appBar: AppBar(title: const Text('My Daily Expenses')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.teal.shade50,
              child: ListTile(
                title: const Text('Total Available Balance'),
                subtitle: Text('₹$totalBalance', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            if (isLowBalance)
              Card(
                color: Colors.red.shade100,
                child: const ListTile(
                  leading: Icon(Icons.warning, color: Colors.red),
                  title: Text('ALERT: Low Balance!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  subtitle: Text('Aapka balance aane wali EMI se kam hai.'),
                ),
              ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Recent Transactions & Khata', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  return ListTile(
                    leading: Icon(
                      item['amount'] < 0 ? Icons.arrow_downward : Icons.arrow_upward,
                      color: item['amount'] < 0 ? Colors.red : Colors.green,
                    ),
                    title: Text(item['title']),
                    subtitle: Text(item['type']),
                    trailing: Text('₹${item['amount'].abs()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
