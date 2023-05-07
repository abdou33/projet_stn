
import 'package:flutter/material.dart';
import 'package:projet_stn/user.dart';
import 'package:projet_stn/craftsman/craftsman.dart';

class PageTow extends StatefulWidget {
   const PageTow({Key? key}) : super(key: key);
  @override
  State<PageTow> createState() => _PageTowState();
}

class _PageTowState extends State<PageTow> {
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
                    "Sign up as a:",
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
                    return const Pageuser();
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
                    return  const Pagecraftsman();
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













/* Column(
            children: [
              Container(
                margin:  const EdgeInsets.only(top: 200),
                child:  const Text(
                  "if you are a literal click on the button",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin:  const EdgeInsets.only(bottom:250 ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){
                        return  PageFour();
                      }
                    ));
                  },
                  icon:  const Icon(
                    Icons.arrow_circle_right,
                    size: 70,
                    color: Colors.black,
                  ),
                ),
              )
            ],    
        ),
        */