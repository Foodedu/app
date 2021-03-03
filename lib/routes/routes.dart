import 'package:flutter/material.dart';
import 'package:food/modules/login/login_screen.dart';
import 'package:food/modules/welcome/welcom_page.dart';

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
        return buildRoute(settings, LoginScreen());
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

  static MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}
