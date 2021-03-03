import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/ghost_button_widget.dart';
import '../../common/widgets/social_button_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import '../../utils/app_images.dart';
import '../../utils/helpers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../common/widgets/password_text_form_field_widget.dart';
import '../../common/widgets/primary_button_widget.dart';
import '../../common/widgets/text_form_field_widget.dart';
import '../../common/widgets/utils.dart';
import '../../data/repository/authen_repository.dart';
import '../../utils/validators.dart';
import '../authentication/bloc/authentication_bloc.dart';
import 'bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthenticationBloc _authenticationBloc;
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _usernameTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.submissionFailure) {
          UtilWidget.hideLoading();
          UtilWidget.showToastError(
              message: 'Tên đăng nhập hoặc mật khẩu không đúng');
        }
        if (state.status == LoginStatus.submissionSuccess) {
          UtilWidget.hideLoading();
          _authenticationBloc.add(
              AuthenticationStatusChanged(AuthenticationStatus.authenticated));
        }
        if (state.status == LoginStatus.submissionInProgress) {
          UtilWidget.showLoading();
        }
      },
      child: KeyboardDismisser(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormFieldWidget(
                controller: _usernameTextController,
                focusNode: _usernameFocus,
                textInputAction: TextInputAction.next,
                hint: 'Email or Phone Number',
                validator: (value) {
                  return Validators.validateNotNullOrEmpty(
                    value,
                    'Email or Phone Number is empty',
                  );
                },
                onFieldSubmitted: (value) {
                  _usernameFocus.unfocus();
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
              ),
              SizedBox(
                height: 8,
              ),
              PasswordFormFieldWidget(
                controller: _passwordTextController,
                focusNode: _passwordFocus,
                hint: 'Password',
                validator: (value) {
                  return Validators.validateNotNullOrEmpty(
                    value,
                    'Password is empty',
                  );
                },
                onFieldSubmitted: (value) {
                  _passwordFocus.unfocus();
                  _onSubmitted();
                },
              ),
              SizedBox(
                height: 16,
              ),
              GhostButtonWidget(
                title: 'Forgot Password?',
                color: AppColors.neutral1,
                onPressed: () {},
              ),
              SizedBox(
                height: 32,
              ),
              PrimaryButtonWidget(
                title: 'Sign In',
                onPressed: _onSubmitted,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'OR',
                style: StylesText.body2,
              ),
              SizedBox(
                height: 16,
              ),
              SocialButtonWidget(
                onPressed: () {
                  print('Continute With Facebook');
                },
                title: 'Continute With Facebook',
                backgroundColor: AppColors.facebookButton,
                icon: AppIcon.icFacebook,
              ),
              SizedBox(
                height: 16,
              ),
              SocialButtonWidget(
                onPressed: () {
                  print('Continue With Google');
                },
                title: 'Continue With Google',
                backgroundColor: AppColors.googleButton,
                icon: AppIcon.icGoogle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitted() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Helpers.hideKeyboard(context);
      try {
        BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(
            username: _usernameTextController.text,
            password: _passwordTextController.text));
      } catch (e) {
        print(e);
      }
    } else {
      print('dd');
      //
    }
  }
}
