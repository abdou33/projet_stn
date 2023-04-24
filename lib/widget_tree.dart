// ignore_for_file: no_logic_in_create_state

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
    // ignore: todo
    // TODO: implement createState
    throw UnimplementedError(); 
  }
}
class _WidgetTreeState extends State<WidgetTree>{
 @override
 Widget build(BuildContext context){
  return StreamBuilder(
    stream: Auth().authStateChange,
    builder: (context, snapshot){
      if (snapshot.hasData){
        return const PageOne();
      }else{
        return LoginPage();
      }
    }
  );
 }
}
