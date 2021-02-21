import 'package:flutter/material.dart';

import 'app.dart';
import 'data/repository/authen_repository.dart';

Future<void> main() async {
  runApp(MyApp(authenticationRepository: AuthenticationRepository()));
}
