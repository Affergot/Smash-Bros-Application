import 'package:flutter/material.dart';

class CharactersPage extends StatefulWidget {
  CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  bool showBestMatchups = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matchup Finder'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.yellowAccent[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 0,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Your Character:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/character_icons/Snake.png",
                            width: 65,
                            height: 65,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade900),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text("Snake",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("Opponent's Character:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/character_icons/Lucina.png",
                            width: 65,
                            height: 65,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade900),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {},
                            child: Text("Lucina",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Text(
                    "Matchup Options",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: showBestMatchups,
                        onChanged: (value) {
                          setState(() {
                            showBestMatchups = value!;
                          });
                        },
                      ),
                      Text(
                        "Show Best Matchups",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      label: Text("Find Matchups",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                          ))),
                ),
              ],
            ),
            Expanded(
              child: Card(
                  elevation: 0,
                  color: Colors.grey[200],
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text("Character Matchups",
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1,
                              ))
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
