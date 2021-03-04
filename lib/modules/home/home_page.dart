import 'package:flutter/material.dart';
import 'package:food/common/widgets/category_widget.dart';
import 'package:food/common/widgets/ghost_button_widget.dart';
import 'package:food/common/widgets/image_network_widget.dart';
import 'package:food/common/widgets/restaurant_item_widget.dart';
import 'package:food/common/widgets/slide_image_widget.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';
import 'package:food/utils/app_images.dart';

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
  var populars = <Browsing>[];

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
    for (var i = 0; i < 10; i++) {
      var _browsing = Browsing()
        ..url = 'https://placeimg.com/640/480/city'
        ..name = 'aut et doloribus'
        ..address = 'magnam molestiae molestiae'
        ..hour = i + 1
        ..distance = 1.1
        ..rating = 5.0
        ..discount = 20
        ..isPreviousOrder = true
        ..cal = 475
        ..price = 12.0;
      populars.add(_browsing);
    }

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
                SizedBox(
                  height: 16,
                ),
                SearchWidget(
                  controller: _searchCtl,
                  hint: 'Search for restaurants, dishes ...',
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 130,
                  padding: EdgeInsets.all(8),
                  child: SlideImageWidget(
                    imgList: imgList,
                    height: 100,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Popular Eatries',
                        style:
                            StylesText.h1.copyWith(color: AppColors.neutral1),
                      ),
                    ),
                    GhostButtonWidget(
                      title: 'View all',
                      onPressed: () {},
                    ),
                  ],
                ),
                popularListView(populars),
                SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Categories',
                    style: StylesText.h1.copyWith(color: AppColors.neutral1),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                categoryListView(populars),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Nearby',
                        style:
                            StylesText.h1.copyWith(color: AppColors.neutral1),
                      ),
                    ),
                    GhostButtonWidget(
                      title: 'View all',
                      onPressed: () {},
                    ),
                  ],
                ),
                popularListView(populars),
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

  Widget popularListView(List<Browsing> browsings) {
    return Container(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: browsings.map((item) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RestaurantItemWidget(
                browsing: item,
                onPressed: () {
                  print('tap item');
                }),
          );
        }).toList(),
      ),
    );
  }

  Widget categoryListView(List<Browsing> browsings) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: browsings.map((item) {
          return CategoryWidget(
            icon: AppIcon.icCategoryMeal,
            label: 'Meal',
            onPressed: () {},
          );
        }).toList(),
      ),
    );
  }
}
