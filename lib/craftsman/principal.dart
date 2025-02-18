import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../chat_screen.dart';
import '../helpers/messages.dart';
import 'profile.dart';

class Craftmanprincipal extends StatefulWidget {
  const Craftmanprincipal({Key? key}) : super(key: key);

  @override
  State<Craftmanprincipal> createState() => _CraftmanprincipalState();
}

class _CraftmanprincipalState extends State<Craftmanprincipal> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  String username2 = "";
  databasemethods databasemethodes = new databasemethods();
  Stream<QuerySnapshot>? chatroomsstream;
  bool is_ready = false;
  String uid = "";

  Widget chatroomlist() {
    return StreamBuilder(
      stream: chatroomsstream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return chatroomsstream != null
            ? snapshot.data != null
                ? ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      // print("b=====================" + data["chatroomID"]);
                      return chatroomstile(
                        data["chatroomID"]
                            .toString()
                            .replaceAll("_", "")
                            .replaceAll(uid, ""),
                        data["chatroomID"],
                        uid,
                      );
                    }).toList(),
                  )
                : Container()
            : Container();
      },
    );
  }

  void initState() {
    getuserinfo();
    super.initState();
  }

  getuserinfo() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      is_ready = true;
    });
    databasemethodes.getchatrooms(uid).then((value) {
      setState(() {
        chatroomsstream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("home page"),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // print(FirebaseAuth.instance.currentUser.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CraftmanProfile(uid: FirebaseAuth.instance.currentUser!.uid)),
                );
              },
            ),
          ],
        ),
        body: is_ready
            ? chatroomlist()
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class chatroomstile extends StatelessWidget {
  final String username;
  final String chatroomid;
  final String uid;
  chatroomstile(this.username, this.chatroomid, this.uid);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                hisid: username,
                hisname: username,
                myid: uid,
                chatroomid: chatroomid,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Container(
          color: const Color.fromARGB(255, 215, 215, 215),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "${username.substring(0, 1).toUpperCase()}",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(username),
            ],
          ),
        ),
      ),
    );
  }
}
