import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shifumi/view/join.dart';

import '../const/colors.dart';
import 'join.dart';
import 'launch.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  _home createState() => new _home(name);
}

class _home extends State<Home> {
  late String name;

  _home(this.name);

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
                  playButton("LAUNCH", Launch(name: name)),
                  playButton("JOIN", Join(name: name)),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => onClick,
                    ));
              },
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

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }
}
