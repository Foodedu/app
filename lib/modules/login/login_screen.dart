import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/app_bar_widget.dart';
import '../../data/repository/authen_repository.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'bloc/login_bloc.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
          child: Scaffold(
        appBar: AppBarWidget(
          title: 'Log in',
          isShowBack: true,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: BlocProvider(
              create: (context) {
                return LoginBloc(
                  authenticationRepository:
                      RepositoryProvider.of<AuthenticationRepository>(context),
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Đăng nhập'),
                    SizedBox(
                      height: 30,
                    ),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
}
