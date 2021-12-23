import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shifumi/model/party.dart';
import 'package:shifumi/model/party_dao.dart';

import '../const/colors.dart';

class Join extends StatefulWidget {
  const Join({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  _join createState() => new _join(name);
}

class _join extends State<Join> {
  late String name;
  _join(this.name);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  String pCode = 'test';
  PartyDao pDao = PartyDao();

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
                  Expanded(
                    child: QRView(
                      cameraFacing: CameraFacing.back, // Use the rear camera
                      key: qrKey, // The global key for the scanner
                      onQRViewCreated:
                          _onQRViewCreated, // Function to call after the QR View is created
                      overlay: QrScannerOverlayShape(
                        // Configure the overlay to look nice
                        borderRadius: 10,
                        borderWidth: 5,
                        borderColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(700, 100, 0, 0),
              child: Text(
                pCode,
                style: const TextStyle(
                  color: ColorsPerso.whiteTitle,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                ),
              ),
            ),
            appTitle(),
          ]),
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        pCode = result!.code!;
        if (pCode.length == 7) {
          Party p = Party
              .empty(); /*= pDao.getParty(pCode, name);
          pCode = p.host;*/
          pCode = pDao.getParty(pCode, name);
          if (p != null) {
            //pCode = p.host;
            /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Waiting(party: p, name: name),
                ));*/
          } else {
            //pCode = "p = null";
          }
        }
      });
    });
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
