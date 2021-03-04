import 'package:flutter/material.dart';
import 'package:food/modules/profile/profile_info_edit/profile_info_edit_screen.dart';
import 'package:get/get.dart';

import '../../common/widgets/app_bar_widget.dart';
import '../../utils/pref.dart';
import '../home/home_page.dart';

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
                Get.to(() => HomePage());
              },
              child: Text('Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
