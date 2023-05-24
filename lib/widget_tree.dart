import 'package:flutter/material.dart';
import 'auth.dart';
import 'craftsman/principal.dart';
import 'user/Principale.dart';
import 'welcome_screen.dart';

class WidgetTree extends StatefulWidget {
  final String usertype;
  const WidgetTree({super.key, required this.usertype});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (widget.usertype != "") {
              if (widget.usertype == "user") {
                return Userprincipal();
              } else if (widget.usertype == "craftman") {
                return Craftmanprincipal();
              }
              return CircularProgressIndicator();
            }
          } else {
            return WelcomeScreen();
          }
          return CircularProgressIndicator();
        });
  }
}
