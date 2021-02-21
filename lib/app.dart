import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'themes/themes.dart';

import 'data/repository/authen_repository.dart';
import 'modules/account/setting_screen.dart';
import 'modules/splash/splash.dart';
import 'modules/authentication/bloc/authentication_bloc.dart';
import 'modules/login/login_screen.dart';
import 'utils/pref.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AuthenticationBloc(
                    authenticationRepository: authenticationRepository,
                  ))
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var pref = LocalPref();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Imag',
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      onGenerateRoute: (_) => DefaultPage.route(),
      theme: AppTheme.lightTheme,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  AccountScreen.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginScreen.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
    );
  }
}
