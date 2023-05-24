import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projet_stn/widget_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  bool _isready = false;
  String usertype = "";

  @override
  Future<void> initState() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? action = prefs.getString('usertype');
    if (action != null) {
      if (action == "user") {
        usertype = "user";
      } else if (action == "craftman") {
        usertype = "craftman";
      }
    }
    setState(() {
      _isready = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isready
          ? WidgetTree(
              usertype: usertype,
            )
          : CircularProgressIndicator()
    );
  }
}
