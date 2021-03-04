import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/browsing_item_widget.dart';
import '../../common/widgets/category_widget.dart';
import '../../common/widgets/history_item_widget.dart';
import '../../common/widgets/order_item_widget.dart';
import '../../common/widgets/restaurant_item_widget.dart';
import '../../common/widgets/search_widget.dart';
import '../../models/browsing.dart';
import '../../models/order.dart';
import '../../utils/app_images.dart';
import '../../utils/pref.dart';
import '../authentication/bloc/authentication_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchCtl = TextEditingController();
  var browsing = Browsing();
  var order = Order();
  var pref = LocalPref();

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
                OutlineButton(
                  onPressed: () {
                    _clickSignOut();
                  },
                  child: Text('Log Out'),
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

  void _clickSignOut() async {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationLogoutRequested());
    await pref.saveBool(PrefKey.isLogged, false);
  }
}
