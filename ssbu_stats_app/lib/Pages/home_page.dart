import 'package:flutter/material.dart';
import 'login_page.dart';
import 'characters_page.dart';
import 'stages_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SB Stats'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.yellowAccent.shade400,
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0D47A1),
                //image: Image.file(File('/logo.jpg')).image)
              ),
              child: Text(
                'SB Stats',
                style: TextStyle(color: Color(0xFFFFEA00)),
              ),
            ),
            ListTile(
              title: const Text('Matchup Finder'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharactersPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Stages'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StagePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Extra'),
              onTap: () {
                // Handle the onTap event here.
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('Welcome to the Smash Bros App'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
