import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit
  String resultCode = '';

  // Methodrf
  Widget authenButton() {
    return RaisedButton(
      color: Colors.orange[700],
      child: Text('Authentication', style: TextStyle(color: Colors.white)),
      onPressed: () {
        print('You click authen');
        readQrCode();
      },
    );
  }

  Future<void> readQrCode() async {
    try {
      resultCode = await BarcodeScanner.scan();
      print('resultCode = $resultCode');
    } catch (e) {}
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Tee Rist',
      style: TextStyle(
        color: Colors.red.shade900,
        fontSize: 30.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
            colors: [Colors.white, Colors.blue],
            radius: 1.0,
          )), // ปรับแต่ง
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                authenButton(),
              ],
            ),
          ),
        ),
      ), //ข้อมูลจะอยู่ใน Content
    );
  }
}
