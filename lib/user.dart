import 'package:flutter/material.dart';

import 'craftsman/profile_page.dart/profile_page.dart';

class Pageuser extends StatefulWidget {
   const Pageuser({Key? key}) : super(key: key);
  @override
  State<Pageuser> createState() => _PageuserState();
}

class _PageuserState extends State<Pageuser> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 30),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
           const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "User name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),

              const SizedBox(height: 10),

              // password textfield
               const SizedBox(height: 10),
           TextFormField(
            obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                prefixIcon: Icon( Icons.password_outlined, ),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
              const SizedBox(height: 25),
                TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: (){
                          Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                        },
                        child: const Text("Login", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                      ),
                   Container(
              padding: const EdgeInsets.all(20),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 4),
                Text(
                  'If you do not have an account',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  //onTap: (){},
                  child:Text("Click Here", style: TextStyle(color: Color.fromARGB(255, 12, 12, 13)) ) ,)
              ],
            ),
            ),
               ],
          ),
        ),
      ),
    );
  }
}