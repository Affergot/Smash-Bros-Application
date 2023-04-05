import 'package:flutter/material.dart';
import 'package:ssbu_stats_app/backend/character_data.dart';
import 'package:ssbu_stats_app/backend/data_manager.dart';

class CharacterSelect extends StatefulWidget {
  const CharacterSelect({super.key});

  @override
  State<CharacterSelect> createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
  final characterFilter = TextEditingController();
  DataManager dataManager = DataManager();

  List<CharacterData> filteredCharacterList = [];

  @override
  void initState() {
    super.initState();
    characterFilter.addListener(() => setState(() {
          filteredCharacterList = characterFilter.text.isEmpty
              ? dataManager.characters
              : dataManager.getFilteredCharacterList(characterFilter.text);
        }));

    filteredCharacterList = dataManager.characters;
  }

  void selectCharacter(index) {
    Navigator.pop(context, filteredCharacterList[index].toMap());
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
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCharacterList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 0),
                      child: Card(
                        child: ListTile(
                            onTap: () {
                              selectCharacter(index);
                            },
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                filteredCharacterList[index].getIconURL(),
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(
                              filteredCharacterList[index].characterName,
                              textAlign: TextAlign.center,
                            )),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
