import 'package:flutter/material.dart';

class CharacterSelect extends StatefulWidget {
  const CharacterSelect({super.key});

  @override
  State<CharacterSelect> createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
  final characterFilter = TextEditingController();

  @override
  void initState() {
    super.initState();
    characterFilter.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          foregroundColor: Colors.yellowAccent.shade400,
          title: const Text("Select a Character"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: characterFilter,
                    decoration: InputDecoration(
                      labelText: "Filter Characters",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: (characterFilter.text.isEmpty)
                          ? const SizedBox(width: 0)
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                characterFilter.clear();
                              },
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
