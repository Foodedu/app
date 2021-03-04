import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/modules/voucher/voucher_page.dart';
import '../../common/widgets/circle_image_widget.dart';
import '../../common/widgets/listtile_widget.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../payment/payment_method_page.dart';
import 'profile_info_edit/profile_info_edit_screen.dart';
import '../../themes/app_colors.dart';
import '../../themes/styles_text.dart';
import '../../utils/pref.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var pref = LocalPref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral5,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerProfile(),
              SizedBox(
                height: 16,
              ),
              ListTileWidget(
                title: 'Voucher',
                icon: Icons.local_offer_sharp,
                onTap: () {
                  Get.to(() => VoucherPage());
                },
              ),
              SizedBox(
                height: 2,
              ),
              ListTileWidget(
                title: 'Payment methods',
                icon: Icons.payment,
                onTap: () {
                  Get.to(() => PaymentMethodPage());
                },
              ),
              SizedBox(
                height: 2,
              ),
              ListTileWidget(
                title: 'Profile & Address',
                icon: Icons.person,
                onTap: () {
                  Get.to(() => ProfileInfoEditScreen());
                },
              ),
              SizedBox(
                height: 16,
              ),
              ListTileWidget(
                title: 'Helper center',
                icon: Icons.headset,
                onTap: () {},
              ),
              SizedBox(
                height: 2,
              ),
              ListTileWidget(
                title: 'About us',
                icon: Icons.info,
                onTap: () {},
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: AppColors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: AppColors.primary1,
                  ),
                  title: Text(
                    'Log Out',
                    style: StylesText.body2.copyWith(color: AppColors.primary1),
                  ),
                  onTap: () {
                    _clickSignOut();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _clickSignOut() async {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationLogoutRequested());
    await pref.saveBool(PrefKey.isLogged, false);
  }

  Widget headerProfile() {
    return Container(
      child: Stack(
        children: [
          userInfo(),
          Positioned(
            top: 80,
            right: 20,
            child: notificationIcon(),
          ),
          Positioned(
            top: -30,
            left: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.primary1.withOpacity(0.5),
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Positioned(
            top: -50,
            left: 50,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary2.withOpacity(0.5),
                borderRadius: BorderRadius.circular(120),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary2.withOpacity(0.5),
                borderRadius: BorderRadius.circular(120),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationIcon() {
    return Container(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.notifications_none,
              size: 35,
              color: AppColors.primary1,
            ),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: AppColors.primary1,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    '9',
                    style: StylesText.body2.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget userInfo() {
    return Container(
      color: AppColors.white,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: CircleImageWidget(
              url: 'https://placeimg.com/640/480/city',
              isServerFile: true,
              size: 120,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Jackeline Schulist',
            style: StylesText.h1.copyWith(
              color: AppColors.neutral1,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '721-877-8629',
            style: StylesText.body1.copyWith(
              color: AppColors.neutral1,
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
