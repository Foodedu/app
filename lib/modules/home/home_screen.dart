import 'package:flutter/material.dart';
import 'package:food/common/widgets/browsing_item_widget.dart';
import 'package:food/common/widgets/category_widget.dart';
import 'package:food/common/widgets/restaurant_item_widget.dart';
import 'package:food/common/widgets/search_widget.dart';
import 'package:food/utils/app_images.dart';
import '../../models/browsing.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchCtl = TextEditingController();
  var browsing = Browsing();

  @override
  void initState() {
    super.initState();
    browsing
      ..url = 'https://placeimg.com/640/480/food'
      ..name = 'aut et doloribus'
      ..address = 'magnam molestiae molestiae'
      ..hour = 5
      ..distance = 1.1
      ..rating = 5.0
      ..discount = 20;
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchWidget(
                controller: _searchCtl,
                hint: 'test',
                onChanged: (value) {
                  print(value);
                },
              ),
              CategoryWidget(
                icon: AppIcon.icFacebook,
                label: 'Drinks ',
                onPressed: () {},
              ),
              BrowsingItemWidget(
                browsing: browsing,
                onPressed: () {
                  print('object');
                },
              ),
              SizedBox(
                height: 16,
              ),
              RestaurantItemWidget(
                browsing: browsing,
                onPressed: () {
                  print('object');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
