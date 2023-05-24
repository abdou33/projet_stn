import 'package:cloud_firestore/cloud_firestore.dart';

class databasemethods {

  getuserbyusername(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .get();
  }

  createchatroom(String chatroomid, chatroommap) {
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatroomid)
        .set(chatroommap)
        .catchError((e) {
      print(e.toString());
    });
  }

  addcnvmessages(String chatroomid, messagemap) {
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatroomid)
        .collection("chats")
        .add(messagemap)
        .catchError((e) {
      print(e.message);
    });
  }

  getcnvmessages(String chatroomid) async {
    return await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatroomid)
        .collection("chats")
        .orderBy("time", descending: false)
        .snapshots();
  }

  getchatrooms(String username) async{
    return await FirebaseFirestore.instance
        .collection("chatrooms")
        .where("users", arrayContains: username)
        .snapshots();
  }
}