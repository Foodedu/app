import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';
import 'package:food/utils/app_images.dart';
import '../home/home_page.dart';
import '../order/order_page.dart';
import '../profile/profile_page.dart';
import '../saved/saved_page.dart';
import '../../routes/routes.dart';

class TabbarPage extends StatefulWidget {
  static final GlobalKey<NavigatorState> homeKey =
      GlobalKey(debugLabel: 'homeNavigatorKey');
  static final GlobalKey<NavigatorState> orderKey =
      GlobalKey(debugLabel: 'orderNavigatorKey');
  static final GlobalKey<NavigatorState> savedKey =
      GlobalKey(debugLabel: 'savedNavigatorKey');
  static final GlobalKey<NavigatorState> profileKey =
      GlobalKey(debugLabel: 'profileNavigatorKey');

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  GlobalKey<NavigatorState> get homeKey => TabbarPage.homeKey;
  GlobalKey<NavigatorState> get orderKey => TabbarPage.orderKey;
  GlobalKey<NavigatorState> get savedKey => TabbarPage.savedKey;
  GlobalKey<NavigatorState> get profileKey => TabbarPage.profileKey;

  int oldTab = 0;
  CupertinoTabController _tabController;
  List<Widget> listTab;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController();
    listTab = [
      CupertinoTabView(
        builder: (BuildContext context) {
          return const HomePage();
        },
        navigatorKey: homeKey,
        onGenerateRoute: Routes.homeRoute,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return const OrderPage();
        },
        navigatorKey: orderKey,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return const SavedPage();
        },
        navigatorKey: savedKey,
      ),
      CupertinoTabView(
        builder: (BuildContext context) {
          return const ProfilePage();
        },
        navigatorKey: profileKey,
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        controller: _tabController,
        tabBuilder: (BuildContext context, int index) {
          return listTab[index];
        },
        tabBar: _buildTabBar(),
      ),
    );
  }

  Widget _buildTabBar() {
    return CupertinoTabBar(
      onTap: onTabTap,
      backgroundColor: AppColors.white,
      items: <BottomNavigationBarItem>[
        _tabItem(title: 'Home', icon: AppIcon.icTabbarHome),
        _tabItem(title: 'Order', icon: AppIcon.icTabbarOrder),
        _tabItem(title: 'Saved', icon: AppIcon.icTabbarSaved),
        _tabItem(title: 'Profile', icon: AppIcon.icTabbarProfile),
      ],
    );
  }

  BottomNavigationBarItem _tabItem(
      {@required String title, @required String icon}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(icon),
        activeIcon: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primary3,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                color: AppColors.primary1,
              ),
              Text(
                title,
                style: StylesText.caption.copyWith(
                  color: AppColors.primary1,
                ),
              )
            ],
          ),
        ));
  }

  void onTabTap(int index) {
    switch (index) {
      case 0:
        if (index != oldTab) {
          break;
        }
        if (homeKey.currentState.canPop()) {
          homeKey.currentState.pop();
        }
        break;
      case 1:
        if (index != oldTab) {
          break;
        }
        if (orderKey.currentState.canPop()) {
          orderKey.currentState.pop();
        }
        break;
      case 2:
        if (index != oldTab) {
          break;
        }
        if (savedKey.currentState.canPop()) {
          savedKey.currentState.pop();
        }
        break;
      case 3:
        if (index != oldTab) {
          break;
        }
        if (profileKey.currentState.canPop()) {
          profileKey.currentState.pop();
        }
        break;
    }
    oldTab = index;
  }
}
