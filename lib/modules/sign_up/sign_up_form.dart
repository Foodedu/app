import 'package:flutter/material.dart';
import 'package:food/common/widgets/ghost_button_widget.dart';
import 'package:food/common/widgets/social_button_widget.dart';
import 'package:food/themes/app_colors.dart';
import 'package:food/themes/styles_text.dart';
import 'package:food/utils/app_images.dart';
import 'package:food/utils/helpers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../common/widgets/password_text_form_field_widget.dart';
import '../../common/widgets/primary_button_widget.dart';
import '../../common/widgets/text_form_field_widget.dart';
import '../../utils/validators.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final _emailCtl = TextEditingController();
  final _passwordCtl = TextEditingController();
  final _confirmPasswordCtl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailCtl.dispose();
    _passwordCtl.dispose();
    _confirmPasswordCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormFieldWidget(
              controller: _emailCtl,
              focusNode: _emailFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              hint: 'Email',
              validator: (value) {
                return Validators.validateEmail(
                  value,
                  'Email is invalid',
                );
              },
              onFieldSubmitted: (value) {
                _emailFocus.unfocus();
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
            ),
            PasswordFormFieldWidget(
              controller: _passwordCtl,
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
                FocusScope.of(context).requestFocus(_confirmPasswordFocus);
              },
            ),
            PasswordFormFieldWidget(
              controller: _confirmPasswordCtl,
              focusNode: _confirmPasswordFocus,
              hint: 'Confirm Password',
              validator: (value) {
                return Validators.validateNotNullOrEmpty(
                  value,
                  'Confirm Password is empty',
                );
              },
              onFieldSubmitted: (value) {
                _passwordFocus.unfocus();
                _onSubmitted();
              },
            ),
            SizedBox(
              height: 32,
            ),
            PrimaryButtonWidget(
              title: 'Sign Up',
              onPressed: _onSubmitted,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmitted() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Helpers.hideKeyboard(context);
    } else {
      //
    }
  }
}
