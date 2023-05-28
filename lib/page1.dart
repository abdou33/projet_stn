import 'package:flutter/material.dart';
import 'package:projet_stn/page2.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox(
        width: double.infinity,
        height: 750,
        child: Column(
          children: [
            const SizedBox(height: 75,),
            Image.asset("images/hi.png"),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Hi , Welcome to the craftsmen app, I hope you find what you need.",
                  style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 10, 10, 10) , fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: IconButton(
                splashColor: const Color.fromARGB(255, 28, 12, 205),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const PageTow();
                  }));
                },
                icon: const Icon(
                  color: Color.fromARGB(255, 7, 107, 79),
                  Icons.arrow_circle_right,
                  size: 80,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
