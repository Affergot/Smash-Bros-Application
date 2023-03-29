import 'package:flutter/material.dart';
import 'package:ssbu_stats_app/tools/login_header.dart';
import 'home_page_with_name.dart';

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
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginHeader(headerName: "Login"),
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
                        var route = MaterialPageRoute(
                          builder: (BuildContext context) =>
                              NewHomePage(title: _emailController.text),
                        );
                        Navigator.of(context).push(route);
                      }
                    },
                  ),
                ],
              ),
            )));
  }
}
