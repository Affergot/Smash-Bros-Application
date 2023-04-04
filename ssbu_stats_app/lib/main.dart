import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(key: UniqueKey()));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SB Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: ''),
    );
  }
}

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
                  MaterialPageRoute(builder: (context) => StagePage()),
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
                child: Text('Main content'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewHomePage extends StatefulWidget {
  final String title;
  NewHomePage({Key? key, this.title = "no one"}) : super(key: key);

  @override
  _NewHomePageState createState() => new _NewHomePageState();

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
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 20, 93, 153)),
                child: Text('SB Stats'),
              ),
              ListTile(title: const Text("Characters"), onTap: () {}),
              ListTile(title: const Text("Stages"), onTap: () {}),
              ListTile(title: const Text("Extra"), onTap: () {}),
            ],
          ),
        ),
        body: new Center(
          child: new Text("Welcome back ${widget.title} to the Smash Bros App"),
        ));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.yellowAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.yellowAccent.shade400,
                    backgroundColor: Colors.blue.shade900),
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new NewHomePage(title: _emailController.text),
                    );
                    Navigator.of(context).push(route);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
