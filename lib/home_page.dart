import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
          brightness: Brightness.light,
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.deepPurple,
        ),
        home: Scaffold(
          appBar: AppBar(
              title: const Text(
            'Home',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
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
                  const Text('Days Absent : 10'),
                ],
              )),
        ));
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
