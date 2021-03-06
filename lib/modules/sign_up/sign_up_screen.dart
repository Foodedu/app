import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../common/widgets/app_bar_widget.dart';
import '../../common/widgets/ghost_button_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import 'sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignUpScreen());
  }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
          child: Scaffold(
        appBar: AppBarWidget(
          isShowBack: true,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Sign Up',
                    style: StylesText.largeTitle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Enter your Email and new Password for sign up, or ',
                        style: StylesText.body1.copyWith(
                          color: AppColors.neutral2,
                        ),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      GhostButtonWidget(
                        title: 'Already have account?',
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SignUpForm(),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          'By signing up you agree to our ',
                          style: StylesText.body1.copyWith(
                            color: AppColors.neutral2,
                          ),
                        ),
                        GhostButtonWidget(
                          title: 'Terms Condition',
                          onPressed: () {},
                        ),
                        Text(
                          ' & ',
                          style: StylesText.body1.copyWith(
                            color: AppColors.neutral2,
                          ),
                        ),
                        GhostButtonWidget(
                          title: 'Privacy Policy',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
}
