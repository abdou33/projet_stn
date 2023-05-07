import 'package:flutter/material.dart';
import 'package:projet_stn/craftsman/login.dart';
import 'package:projet_stn/page1.dart';
import 'auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const PageOne();
          } else {
            return LoginPage();
          }
        });
  }
}
