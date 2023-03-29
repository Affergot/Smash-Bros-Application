import 'package:flutter/material.dart';
import 'home_page.dart';
import 'characters_page.dart';
import 'stages_page.dart';

class NewHomePage extends StatefulWidget {
  final String title;
  const NewHomePage({Key? key, this.title = "no one"}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          foregroundColor: Colors.yellowAccent.shade400,
          title: const Text('SB Stats'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
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
                title: const Text('Characters'),
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
        body: Center(
          child: Text("Welcome back ${widget.title} to the Smash Bros App"),
        ));
  }
}
