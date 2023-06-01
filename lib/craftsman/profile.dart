import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../chat_screen.dart';
import '../classes/craftman.dart';
import '../helpers/messages.dart';

class CraftmanProfile extends StatefulWidget {
  final String uid;
  const CraftmanProfile({super.key, required this.uid});

  @override
  State<CraftmanProfile> createState() => _CraftmanProfileState();
}

class _CraftmanProfileState extends State<CraftmanProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  databasemethods databasemethodes = new databasemethods();
  bool is_ready = false;
  String uid = "";
  late Craftman craftman;

  @override
  void initState() {
    getuserinfo();
    super.initState();
  }

  getuserinfo() async {
    FirebaseFirestore.instance
        .collection('craftman')
        .doc(widget.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        craftman = Craftman(
            documentSnapshot.get('craftname'),
            documentSnapshot.get('firstname'),
            documentSnapshot.get('lastname'),
            documentSnapshot.get('email'),
            documentSnapshot.get('location'),
            documentSnapshot.get('phonenumber'),
            documentSnapshot.get('uid'));
      } else {
        print('Document does not exist on the database');
      }
      setState(() {
        is_ready = true;
      });
    });
    // Document data: {uid: u8sEpeSJoWhpcsPgGZXpuvBSu0n1, firstname: salah, craftname: painter, phonenumber: 0988777888, location: illizi, email: salah@gmail.com, lastname: bou}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: is_ready
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      Text(craftman.firstname + " " + craftman.lastname),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      Text(craftman.craftname),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      Text(craftman.location),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone),
                      Text(craftman.phonenumber),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email),
                      Text(craftman.email),
                    ],
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
