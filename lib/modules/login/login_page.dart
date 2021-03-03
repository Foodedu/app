import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../common/widgets/app_bar_widget.dart';
import '../../common/widgets/ghost_button_widget.dart';
import '../../data/repository/authen_repository.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import '../sign_up/sign_up_screen.dart';
import 'bloc/login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
          child: Scaffold(
        appBar: AppBarWidget(
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
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
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
