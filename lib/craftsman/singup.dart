
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_stn/craftsman/craftsman.dart';
import 'package:projet_stn/craftsman/profile_page.dart/profile_page.dart';
import '../square_tile.dart';
import '../user.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
   var usernameController;
   var passwordController;
   return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon( Icons.app_registration_outlined,size: 100, ),
            Text(
              'Welcome to our application',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "First name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),
             const SizedBox(height: 10),
           TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last name",
                prefixIcon: Icon(Icons.account_circle),
                filled: true,
                fillColor: Color.fromARGB(255, 215, 223, 215)
              ),
            ),


            const SizedBox(height: 10),
            

            // sign in button
            TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: (){
                          Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Pageuser();
                  }));
                        },
                        child: const Text("sing up", style: TextStyle(fontSize: 25),),
                      ),
             const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 4),
                Text(
                  'Already have account',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}

Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [ SingleChildScrollView(
           scrollDirection: Axis.horizontal,
      child: Text(label,style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),),
      const SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      const SizedBox(height: 30,)
    ],
  );
}
