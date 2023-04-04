import 'package:flutter/material.dart';
import 'package:ssbu_stats_app/backend/data_manager.dart';
import 'stages_page.dart';

class TempPage extends StatefulWidget {
  final String characterName;
  String characterData = '';
  TempPage({Key? key, this.characterName = ''}) : super(key: key);

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  String _characterData = 'empty';

  void _findCharacterData() {
    final csvReader = CsvReaderGenericResults();
    final characterData = csvReader.findCharacter(widget.characterName);
    setState(() {
      _characterData = characterData;
    });
  }

  @override
  Widget build(BuildContext context) {
    _findCharacterData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Data'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.yellowAccent[400],
      ),
      body: Text("${widget.characterName} $_characterData"),
    );
  }
}
