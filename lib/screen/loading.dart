import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../const/colors.dart';

class Loading extends StatefulWidget {
  @override
  _loading createState() => new _loading();
}

class _loading extends State<Loading> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    FocusNode myFocusNode = new FocusNode();

    return MaterialApp(
        title: "ShiFuMi",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: ExactAssetImage('assets/images/home_background.jpg'),
              )),
            ),
            Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0),
                      child: TextField(
                        focusNode: myFocusNode,
                        controller: nameController,
                        maxLength: 25,
                        //onChanged: (v) => nameController.text = v,
                        decoration: InputDecoration(
                          counterText: "",
                          labelText: 'Enter your name',
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.black),
                          fillColor: ColorsPerso.whiteTitle,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorsPerso.whiteTitle)),
                      onPressed: () => {
                        /*if (nameController.text.length > 2) {
                          // Lancer la vue suivante avec le nom du joueur
                        } else {
                          // TODO: Afficher un message d'erreur : nom pas assez long
                        }*/
                      },
                      child: const Text(
                        'PLAY',
                        style: TextStyle(
                          color: ColorsPerso.red,
                          decoration: TextDecoration.none,
                          fontSize: 40,
                          fontFamily: 'Calamity',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  width: 200.0,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: ColorsPerso.whiteTitle,
                    width: 15.0,
                  )),
                  child: const Center(
                    child: Text('SHI\nFU\nMI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsPerso.whiteTitle,
                          decoration: TextDecoration.none,
                          fontSize: 60,
                          fontFamily: 'Calamity',
                        ),
                        maxLines: 3),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}
