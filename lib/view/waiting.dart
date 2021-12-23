import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shifumi/model/party.dart';

import '../const/colors.dart';

class Waiting extends StatefulWidget {
  const Waiting({Key? key, required this.name, required this.party})
      : super(key: key);

  final String name;
  final Party party;

  @override
  _waiting createState() => new _waiting(name, party);
}

class _waiting extends State<Waiting> {
  late String name;
  late Party party;

  _waiting(this.name, this.party);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  QrImage(
                    data: "1234567890",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ],
              ),
            ),
            appTitle(),
          ]),
        ));
  }

  Widget playButton(text, onClick) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorsPerso.whiteGrayTrsp)),
              onPressed: () => {onClick},
              child: Text(
                text,
                style: const TextStyle(
                  color: ColorsPerso.whiteTitle,
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
    );
  }

  Container appTitle() {
    return Container(
      margin: const EdgeInsets.all(45.0),
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
              fontSize: 65,
              fontFamily: 'Calamity',
            ),
            maxLines: 3),
      ),
    );
  }
}
