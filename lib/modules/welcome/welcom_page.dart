import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final int index;

  const WelcomePage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Welcome'),
    );
  }
}
