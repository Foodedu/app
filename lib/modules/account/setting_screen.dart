import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/common/widgets/app_bar_widget.dart';
import 'package:food/modules/home/home_screen.dart';
import 'package:get/get.dart';

import '../../utils/pref.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../profile_info_edit/profile_info_edit_screen.dart';

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
      appBar: AppBarWidget(
        isShowBack: false,
        title: 'Account',
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            OutlineButton(
              onPressed: () {
                Get.to(() => ProfileInfoEditScreen());
              },
              child: Text('Profile & Address edit'),
            ),
            OutlineButton(
              onPressed: () {
                Get.to(() => HomeScreen());
              },
              child: Text('Home Screen'),
            ),
            OutlineButton(
              onPressed: () {
                _clickSignOut();
              },
              child: Text('Log Out'),
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
