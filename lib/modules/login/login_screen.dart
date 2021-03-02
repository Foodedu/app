import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/common/widgets/ghost_button_widget.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Sign In',
                      style: StylesText.largeTitle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: StylesText.body1.copyWith(
                            color: AppColors.neutral2,
                          ),
                        ),
                        GhostButtonWidget(
                          title: 'Sign up now!',
                          onPressed: () {},
                        )
                      ],
                    ),
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
