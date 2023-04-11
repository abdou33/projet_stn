import 'package:firebase_auth_project/auth.dart';
import 'package:firebase_auth_project/pages/page1.dart';
import 'package:firebase_auth_project/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:projet_stn/craftsman/login.dart';
import 'package:projet_stn/page1.dart';

import 'auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);
  @override
  State<WidgetTree> creatState() => _WidgetTreeState();
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
class _WidgetTreeState extends State<WidgetTree>{
 @override
 Widget build(BuildContext context){
  return StatefulBuilder(
    stream: Auth().authStateChange,
    builder: (context, snapshot),{
      if (snapshot.hashdat){
        return PageOne();
      }else{
        return LoginPage();
      }
    }
  );
 }
}
