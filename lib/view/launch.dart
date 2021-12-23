import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shifumi/model/party.dart';
import 'package:shifumi/model/party_dao.dart';

import '../const/colors.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  _launch createState() => new _launch(name);
}

class _launch extends State<Launch> {
  late String name;

  _launch(this.name);

  Party p = Party.empty();
  PartyDao pDao = PartyDao();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    p = Party(name, "", 1, 3);
    pDao.saveParty(p);

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
                    backgroundColor: Colors.white,
                    data: p.code,
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

  void save() {
    pDao.saveParty(p);
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
