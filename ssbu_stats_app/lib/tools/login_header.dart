// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class loginHeader extends StatelessWidget {
  String headerName;

  loginHeader({super.key, required this.headerName});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 50.0),
      Text(
        headerName,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40.0),
      ),
      const SizedBox(height: 10.0),
      Image.asset(
        "assets/character_icons/Logo.png",
        height: 150.0,
      ),
      const SizedBox(height: 10.0),
    ]);
  }
}
