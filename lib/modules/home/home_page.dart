import 'package:flutter/material.dart';
import 'package:food/common/widgets/image_network_widget.dart';
import 'package:food/common/widgets/slide_image_widget.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';

import '../../common/widgets/search_widget.dart';
import '../../models/browsing.dart';
import '../../models/order.dart';
import '../../utils/pref.dart';
import '../../models/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchCtl = TextEditingController();
  var browsing = Browsing();
  var order = Order();
  var _profile = Profile();
  var pref = LocalPref();
  var imgList = <String>[];

  @override
  void initState() {
    super.initState();
    imgList = [
      'https://placeimg.com/640/480/animals',
      'https://placeimg.com/640/480/food',
      'https://placeimg.com/640/480/city'
    ];
    _profile = Profile()
      ..avatar = 'https://placeimg.com/640/480/food'
      ..email = 'daivph@gmail.com'
      ..phone = '0123456789'
      ..fullname = 'Đại Võ';
    browsing
      ..url = 'https://placeimg.com/640/480/food'
      ..name = 'aut et doloribus'
      ..address = 'magnam molestiae molestiae'
      ..hour = 5
      ..distance = 1.1
      ..rating = 5.0
      ..discount = 20
      ..isPreviousOrder = true
      ..cal = 475
      ..price = 12.0;
    order
      ..url = 'https://placeimg.com/640/480/fashion'
      ..name = 'aut et doloribus'
      ..description = 'magnam molestiae molestiae'
      ..hour = 5
      ..distance = 1.1
      ..rating = 5.0
      ..discount = 20
      ..isPreviousOrder = true
      ..cal = 475
      ..price = 12.0;
  }

  @override
  void dispose() {
    super.dispose();
    _searchCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                headerHome(_profile),
                SearchWidget(
                  controller: _searchCtl,
                  hint: 'Search for restaurants, dishes ...',
                  onChanged: (value) {},
                ),
                Container(
                  height: 130,
                  padding: EdgeInsets.all(8),
                  child: SlideImageWidget(
                    imgList: imgList,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerHome(Profile profile) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: 'Hello, ',
                      style: StylesText.h1.copyWith(
                        color: AppColors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${profile.fullname ?? ''}!',
                          style: StylesText.h1.copyWith(
                            color: AppColors.primary1,
                          ),
                        )
                      ]),
                ),
              ),
              NetworkImageWidget(
                url: profile.avatar,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '421 Rashad Cape, Port Kristopherview',
                style: StylesText.caption.copyWith(color: AppColors.neutral3),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.primary1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
