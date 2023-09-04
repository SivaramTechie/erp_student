import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Home',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.settings),
          onPressed: () {
            context.go('/settings');
          }),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgBar('Java', 0.5),
            ProgBar('Open Source Technologies', 0.2),
            ProgBar('Data Structures', 0.4),
            ProgBar('Financial Accounting', 0.8),
            ProgBar('C', 0.7),
            ProgBar('Soft Skills', 0.6),
            const SizedBox(
              height: 50,
            ),
            const Cards(),
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Theme.of(context).colorScheme.primaryContainer),
            height: 50,
            width: 150,
            child: const Center(child: Text('Days Present : 30')),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Theme.of(context).colorScheme.secondaryContainer),
            height: 50,
            width: 150,
            child: const Center(child: Text('Days Absent : 10')),
          ),
        ],
      ),
    );
  }
}

class ProgBar extends StatelessWidget {
  ProgBar(this.sub, this.prog, {super.key});
  String sub;
  double prog;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sub,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            child: LinearProgressIndicator(
              value: prog,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 168, 128, 237)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
