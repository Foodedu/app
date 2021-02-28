import 'package:flutter/material.dart';
import 'package:food/common/widgets/dropdown_widget.dart';
import 'package:food/modules/profile_info_edit/widgets/avatar_profile_widget.dart';
import 'package:food/utils/helpers.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../common/widgets/app_bar_widget.dart';
import '../../common/widgets/primary_button_widget.dart';
import '../../common/widgets/text_form_field_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import '../../utils/validators.dart';

class ProfileInfoEditScreen extends StatefulWidget {
  @override
  _ProfileInfoEditScreenState createState() => _ProfileInfoEditScreenState();
}

class _ProfileInfoEditScreenState extends State<ProfileInfoEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtl = TextEditingController();
  final _lastNameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _genderCtl = TextEditingController();
  final _phoneCtl = TextEditingController();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _firstNameCtl.dispose();
    _lastNameCtl.dispose();
    _emailCtl.dispose();
    _genderCtl.dispose();
    _phoneCtl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Profile & Address',
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: SingleChildScrollView(
                child: _formProfileInfo(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PrimaryButtonWidget(
              onPressed: _onSubmit,
              title: 'save',
            ),
          )
        ]),
      ),
    );
  }

  void _onSubmit() {
    Helpers.hideKeyboard(context);
    _formKey.currentState.validate();
  }

  Widget _formProfileInfo() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Center(
            child: Container(
              child: AvatarProfileWidget(),
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            'User Information',
            style: StylesText.h1.copyWith(
              color: AppColors.neutral1,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: TextFormFieldWidget(
                  controller: _firstNameCtl,
                  textInputAction: TextInputAction.next,
                  hint: 'First Name',
                  validator: (value) {
                    return Validators.validateNotNullOrEmpty(
                        value, 'First Name is empty');
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_lastNameFocus);
                  },
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 4,
                child: TextFormFieldWidget(
                  controller: _lastNameCtl,
                  focusNode: _lastNameFocus,
                  textInputAction: TextInputAction.next,
                  hint: 'Last Name',
                  validator: (value) {
                    return Validators.validateNotNullOrEmpty(
                        value, 'Last Name is empty');
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_emailFocus);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          TextFormFieldWidget(
            controller: _emailCtl,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocus,
            hint: 'Email',
            validator: (value) {
              return Validators.validateEmail(
                value,
                'Email is invalid',
              );
            },
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_phoneFocus);
            },
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: DropdownWidget(
                  items: ['Male', 'Female'],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 4,
                child: TextFormFieldWidget(
                  keyboardType: TextInputType.phone,
                  controller: _phoneCtl,
                  focusNode: _phoneFocus,
                  hint: 'Phone',
                  validator: (value) {
                    return Validators.validatePhoneNumber(
                        value, 'Phone number is invalid');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
