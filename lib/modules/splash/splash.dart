import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => DefaultPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
