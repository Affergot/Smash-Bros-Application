import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
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
