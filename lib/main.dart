import 'package:flutter/material.dart';

void main() {
  runApp(const NullaDoo());
}

class NullaDoo extends StatelessWidget {
  const NullaDoo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NullaDoo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          surface: const Color(0xFF0A0F0A),
          primary: const Color(0xFF39FF14),
          secondary: const Color(0xFF1FAA3F),
          onSurface: const Color(0xFF39FF14),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0F0A),
      ),
      home: const ListsScreen(),
    );
  }
}

class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NullaDoo')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Groceries'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('Work stuff'),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            title: const Text('World domination'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
