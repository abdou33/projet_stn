
import 'package:flutter/material.dart';

import 'craftsman/login.dart';
import 'user/signin_user.dart';

class Signinboth extends StatefulWidget {
   const Signinboth({Key? key}) : super(key: key);
  @override
  State<Signinboth> createState() => _SigninbothState();
}

class _SigninbothState extends State<Signinboth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
          // ignore: avoid_unnecessary_containers
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Center(child: Image.asset("images/hi.png")),
                Container(
                  margin:  const EdgeInsets.only(top: 50),
                  child:  const Text(
                    "Signin as a:",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: (){
                          Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Signinuser();
                  }));
                        },
                        child: const Text("user", style: TextStyle(fontSize: 25),),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                        ),
                        onPressed: (){
                          Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return  const Logincraftman();
                  }));
                        },
                        child: const Text("craftsman", style: TextStyle(fontSize: 25),),
                      ),
                    )
                  ],  
          ),
        ),
      )
   ) ;
  }
}