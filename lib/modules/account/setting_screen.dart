import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_images.dart';

import '../../utils/pref.dart';
import '../authentication/bloc/authentication_bloc.dart';

class AccountScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AccountScreen());
  }

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var pref = LocalPref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImage.avatar),
            Container(
              child: OutlineButton(
                onPressed: () {
                  _clickSignOut();
                },
                child: Text('Đăng xuất'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clickSignOut() async {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationLogoutRequested());
    await pref.saveBool(PrefKey.isLogged, false);
  }
}
