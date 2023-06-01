import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../chat_screen.dart';
import '../classes/craftman.dart';
import '../helpers/messages.dart';

class CraftmanProfile extends StatefulWidget {
  final Craftman craftman;
  const CraftmanProfile({super.key, required this.craftman});

  @override
  State<CraftmanProfile> createState() => _CraftmanProfileState();
}

class _CraftmanProfileState extends State<CraftmanProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  databasemethods databasemethodes = new databasemethods();
  bool is_ready = false;
  String uid = "";
  @override
  void initState() {
    getuserid();
    super.initState();
  }

  getuserid() async {
    uid = _auth.currentUser!.uid;
    setState(() {
      is_ready = true;
    });
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  //create chat room, send user to cnv screen, pushreplacement
  createchatroomandsendstartcnv() {
    print("creating a chatroom...............\n");
    String chatroomid = getChatRoomId(uid, widget.craftman.uid);
    List<String?> users = [uid, widget.craftman.uid];
    Map<String, dynamic> Chatroommap = {
      "users": users,
      "chatroomID": chatroomid,
    };
    databasemethodes.createchatroom(chatroomid, Chatroommap);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatScreen(
                  hisid: widget.craftman.uid,
                  hisname: widget.craftman.firstname +
                      " " +
                      widget.craftman.lastname,
                  myid: uid,
                  chatroomid: chatroomid,
                )));
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
                      Text(widget.craftman.firstname +
                          " " +
                          widget.craftman.lastname),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      Text(widget.craftman.craftname),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      Text(widget.craftman.location),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone),
                      Text(widget.craftman.phonenumber),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email),
                      Text(widget.craftman.email),
                    ],
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("message "),
                        Icon(Icons.message),
                      ],
                    ),
                    onPressed: () {
                      createchatroomandsendstartcnv();
                    },
                  )
                ],
              ),
            )
          :const Center(child: CircularProgressIndicator()),
    );
  }
}
