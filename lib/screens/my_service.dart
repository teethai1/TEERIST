import 'package:flutter/material.dart';
import 'package:teerist/Models/user_model.dart';
import 'package:teerist/widget/page1.dart';
import 'package:teerist/widget/page2.dart';
import 'package:teerist/widget/page3.dart';

class MyService extends StatefulWidget {
  //ใช้ในการรับค่า
  //
  final UserModel userModel;
  MyService({Key key, this.userModel})
      : super(key: key); //สร้างตัวแปรรับระดับ โมเดล
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  //สร้างสเตจ เล้น
// Explicit
  String loginString = '';
  UserModel myUserModel;
  Widget currentWidget = Page1();
// Method
  void initState() {
    //ทำงานก่อน เหมือน Sub new
    super.initState();
    myUserModel = widget.userModel;
    String name = myUserModel.name;
    String surName = myUserModel.surName;
    loginString = '$name $surName';
  }

  Widget menuPage1() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        size: 36.0,
      ),
      title: Text('Page 1'), //Icon สามารถหาได้ในเว็ย Material.io
      subtitle: Text('คำอธิยาย Page1'),
      onTap: () {
        setState(() { //Clear State
         currentWidget = Page1(); 
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget menuPage2() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        size: 36.0,
      ),
      title: Text('Page 2'), //Icon สามารถหาได้ในเว็ย Material.io
      subtitle: Text('คำอธิยาย Page2'),
            onTap: () {
              setState(() {
               currentWidget = Page2(); 
              });
        Navigator.of(context).pop();
      },
    );
  }

  Widget menuPage3() {
    return ListTile(
      leading: Icon(
        Icons.filter_3,
        size: 36.0,
      ),
      title: Text('Page 3'), //Icon สามารถหาได้ในเว็ย Material.io
      subtitle: Text('คำอธิยาย Page3'),
            onTap: () {
              setState(() {
               currentWidget = Page3(); 
              });
        Navigator.of(context).pop();
      },
    );
  }

  Widget showLogin() {
    return Text('Login by $loginString');
  }

  Widget showAppName() {
    return Text('Tee Rist');
  }

  Widget showHeadDrawer() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          showLogo(),
          showAppName(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHeadDrawer(),
          menuPage1(),
          Divider(),
          menuPage2(),
          Divider(),
          menuPage3(),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: currentWidget,
      drawer: showDrawer(),
    );
  }
}
