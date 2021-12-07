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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        title: "ShiFuMi - Chargement",
        home: Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.topCenter,
              image: ExactAssetImage('assets/images/home_background.jpg'),
            )),
          ),
          const Center(
              child: Text(
            'Chargement',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none),
          )),
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
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: 'Calamity',
                      ),
                      maxLines: 3),
                ),
              )
            ],
          )
        ]));
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    paintALine(50.0, 50.0, 200.0, 50.0, canvas);
    paintALine(50.0, 50.0, 50.0, size.height * 0.8, canvas);
    paintALine(200.0, 50.0, 200.0, size.height * 0.8, canvas);
  }

  void paintALine(xa, ya, xb, yb, canvas) {
    var paint = Paint()
      ..color = const Color(0xBE2C3556)
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.square;

    Offset startingPoint = Offset(xa, ya);
    Offset endingPoint = Offset(xb, yb);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
