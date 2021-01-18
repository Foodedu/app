import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Food Delivery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'SCREENS',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Login Screen'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Home Screen'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Restaurant Screen'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Restaurant Info Screen'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Restaurant Menu'),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Food Option Screen'),
              ),
            ],
          ),
        ));
  }
}
