// ignore: file_names
import 'package:flutter/material.dart';

void main() {
  // ignore: unnecessary_new
  runApp(new MaterialApp(
    // ignore: unnecessary_new
    home: new Dashboard(),
  ));
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Dashboard'),
      ),
      // ignore: unnecessary_new
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Text('Orders'),
                    new Text('100'),
                  ],
                ),
              ),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Text('Revenue'),
                    new Text('\$10,000'),
                  ],
                ),
              ),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Text('Customers'),
                    new Text('1000'),
                  ],
                ),
              ),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Text('Products'),
                    new Text('1000'),
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