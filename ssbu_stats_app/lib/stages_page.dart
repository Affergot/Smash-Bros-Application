import 'package:flutter/material.dart';

class StagePage extends StatelessWidget {
  const StagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stages'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.yellowAccent.shade400,
      ),
      body: const Center(
        child: Text('This is the stage picker page'),
      ),
    );
  }
}
