import 'package:flutter/material.dart';

class Pageuser extends StatefulWidget {
   const Pageuser({Key? key}) : super(key: key);
  @override
  State<Pageuser> createState() => _PageuserState();
}

class _PageuserState extends State<Pageuser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: 750,
          decoration:  const BoxDecoration(
         ),
         child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin:  const EdgeInsets.only(top: 200),
                child:  const Text(
                  "why are you looking at me?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ]  
        ),
      ),
    ),
    );
  }
}         