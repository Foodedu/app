import 'package:flutter/material.dart';

import '../modules/login/login_page.dart';
import '../modules/tabbar/tabbar_page.dart';
import '../modules/welcome/welcom_page.dart';
import 'route_name.dart';

class Routes {
  static Route buildRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomePage:
        if (settings.arguments is int) {
          final index = settings.arguments;
          return buildRoute(
              settings,
              WelcomePage(
                index: index,
              ));
        }
        return buildRoute(settings, const WelcomePage());
      case RouteName.loginPage:
        return buildRoute(settings, LoginPage());
      case RouteName.tabbarPage:
        return buildRoute(settings, TabbarPage());
      default:
        return _errorRoute();
    }
  }

  static Route homeRoute(RouteSettings settings) {
    return buildRoutes(settings);
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static Route tabbarRoute() {
    return MaterialPageRoute(builder: (_) {
      return TabbarPage();
    });
  }

  static Route loginRoute() {
    return MaterialPageRoute(builder: (_) {
      return LoginPage();
    });
  }

  static MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}
