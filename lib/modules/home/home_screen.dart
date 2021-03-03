import 'package:flutter/material.dart';
import 'package:food/common/widgets/browsing_item_widget.dart';
import 'package:food/common/widgets/category_widget.dart';
import 'package:food/common/widgets/dash_line_widget.dart';
import 'package:food/common/widgets/history_item_widget.dart';
import 'package:food/common/widgets/order_item_widget.dart';
import 'package:food/common/widgets/restaurant_item_widget.dart';
import 'package:food/common/widgets/search_widget.dart';
import 'package:food/common/widgets/ticket_widget.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/utils/app_images.dart';
import '../../models/browsing.dart';
import '../../models/order.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchCtl = TextEditingController();
  var browsing = Browsing();
  var order = Order();

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
                SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TicketWidget(
                    child: Text('sdfsdfd'),
                    width: 350,
                    height: 100,
                    color: Colors.white,
                    isCornerRounded: true,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
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
                ),
                SizedBox(
                  height: 8,
                ),
                OrderItemWidget(
                  order: order,
                  onPressed: () {
                    print('object');
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                HistoryItemWidget(
                  order: order,
                  onPressed: () {
                    print('object');
                  },
                  onPressedRating: () {
                    print('rating');
                  },
                  onPressedReOrder: () {
                    print('re-order');
                  },
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
