import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'squad_controller.dart';

class SquadPage extends StatefulWidget {
  final String title;
  const SquadPage({Key key, this.title = "Squad"}) : super(key: key);

  @override
  _SquadPageState createState() => _SquadPageState();
}

class _SquadPageState extends ModularState<SquadPage, SquadController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            child: Card(
              child: Row(
                children: [
                  Container(
                    height: 150,
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/43920849?s=460&u=1e9d942b25b9f420196965ee2dffcbac91d6442f&v=4",
                      fit: BoxFit.fitHeight,
                      width: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Marcelo Eliseu",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(height: 1, color: Colors.black),
                        Text(
                          "maeliseu@gmail.com",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ButtonBar(
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.blue,
                                ),
                                onPressed: () {}),
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.github,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
