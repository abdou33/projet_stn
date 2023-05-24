import 'dart:async';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../helpers/messages.dart';

class ChatScreen extends StatefulWidget {
  final String hisname;
  final String myid;
  final String hisid;
  final String chatroomid;
  const ChatScreen(
      {Key? key,
      required this.hisname,
      required this.myid,
      required this.hisid,
      required this.chatroomid})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgeditingcontroller = TextEditingController();
  databasemethods databasemethodes = new databasemethods();
  Stream<QuerySnapshot>? chatmessageStream;
  // here we set the timer to call the event
  ScrollController _myController = ScrollController();

  sendmessage() {
    if (msgeditingcontroller.text.isNotEmpty) {
      Map<String, dynamic> messagemap = {
        "message": msgeditingcontroller.text,
        "sendby": widget.myid,
        "time": DateTime.now().millisecondsSinceEpoch,
      };
      databasemethodes.addcnvmessages(widget.chatroomid, messagemap);
      msgeditingcontroller.clear();
    }
  }

  Widget chatmessagelist() {
    return StreamBuilder(
      stream: chatmessageStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return chatmessageStream != null
            ? snapshot.data != null
                ? ListView(
                    controller: _myController,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      //print(data["message"]);
                      if (widget.myid != data["sendby"] &&
                          (DateTime.now().millisecondsSinceEpoch -
                                  data["time"]) <
                              5000) {
                        print("diference = " +
                            (DateTime.now().millisecondsSinceEpoch -
                                    data["time"])
                                .toString());
                      }
                      Future.delayed(Duration(milliseconds: 100), () {
                        _myController.animateTo(
                            _myController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 50),
                            curve: Curves.ease);
                      });
                      return messagetile(
                        data["message"],
                        widget.myid == data["sendby"],
                        data["time"],
                      );
                    }).toList(),
                  )
                : Container()
            : Container();
      },
    );
  }

  @override
  void initState() {
    databasemethodes.getcnvmessages(widget.chatroomid).then((value) {
      setState(() {
        chatmessageStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Text("${widget.hisname}"),
      ),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 70),
              child: chatmessagelist(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: msgeditingcontroller,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      sendmessage();
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class messagetile extends StatelessWidget {
  final String message;
  final bool sendby;
  final int time;
  messagetile(this.message, this.sendby, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendby ? 0 : 24, right: sendby ? 24 : 0),
      alignment: sendby ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin:
                sendby ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
            padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: sendby
                    ? BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23))
                    : BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomRight: Radius.circular(23)),
                color: Colors.orange),
            child: Text(message,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w500)),
          ),
          Text(
              DateFormat('dd/MM/yyyy, HH:mm')
                  .format(DateTime.fromMillisecondsSinceEpoch(time))
                  .toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
