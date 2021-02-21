import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/utils.dart';
import '../../data/repository/authen_repository.dart';
import '../../themes/styles_text.dart';
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _usernameField(),
            SizedBox(
              height: 8,
            ),
            _passwordField(),
            SizedBox(
              height: 32,
            ),
            OutlineButton(
              onPressed: _onSubmitted,
              child: Text(
                'Đăng nhập',
                style: StylesText.body1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      decoration: InputDecoration(hintText: 'username'),
      keyboardType: TextInputType.text,
      controller: _usernameTextController,
      textInputAction: TextInputAction.next,
      focusNode: _usernameFocus,
      validator: (_) {
        return Validators.validateNotNullOrEmpty(
            _usernameTextController.text, 'Vui lòng nhập email');
      },
      onFieldSubmitted: (_) {
        _usernameFocus.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
        decoration: InputDecoration(hintText: 'Mật khẩu'),
        controller: _passwordTextController,
        focusNode: _passwordFocus,
        validator: (_) {
          return Validators.validateNotNullOrEmpty(
              _passwordTextController.text, 'Vui lòng nhập mật khẩu');
        },
        onFieldSubmitted: (_) {
          _passwordFocus.unfocus();
          _onSubmitted();
        },
        obscureText: true);
  }

  void _onSubmitted() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      var currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(
          username: _usernameTextController.text,
          password: _passwordTextController.text));
    } else {
      //
    }
  }
}
