import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:teerist/Models/user_model.dart';
import 'package:teerist/screens/my_alert.dart';
import 'package:teerist/screens/my_service.dart';

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
        // getUserWhereResultCode();
      },
    );
  }

  Future<void> readQrCode() async {
    try {
      resultCode = await BarcodeScanner.scan();
      print('resultCode = $resultCode');
      getUserWhereResultCode();
    } catch (e) {}
  }

  Future<void> getUserWhereResultCode() async {
    print('work');
    String urlAPI =
        'http://10.28.50.26/getUserWhereResultTeeThai.php?isAdd=true&ResultCode=$resultCode';
    Response response = await get(urlAPI);
    print('======================response= $response');
    var result = json.decode(response.body);
    print('result ================================>>>>>>>>>>>>>>>>>> $result');
    if (result.toString() == 'null') {
      normalDialog('Result False', 'No $resultCode in my database', context);
    } else {
      //เราจะต้องส่งข้อมูลเป็น Model ไปอีก ฟอร์มนึง
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) {
          return MyService(
            userModel: userModel,
          );
        }); //เป็นการสั่งให้คลาสอื่นทำงาน
        Navigator.of(context).pushAndRemoveUntil(materialPageRoute,
            (Route<dynamic> route) {
          return false;
        }); //ย้อน
      }
    }
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
