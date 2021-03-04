import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/app_bar_widget.dart';
import '../../common/widgets/listtile_widget.dart';
import '../../themes/app_colors.dart';
import 'credit_card_page.dart';

class PaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral5,
      appBar: AppBarWidget(
        title: 'Payment Methods',
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          ListTileWidget(
            title: 'e-Wallet',
            icon: Icons.account_balance_wallet_outlined,
            onTap: () {},
          ),
          SizedBox(
            height: 2,
          ),
          ListTileWidget(
            title: 'Credit Card',
            icon: Icons.credit_card,
            onTap: () {
              Get.to(CreditCardPage());
            },
          ),
          SizedBox(
            height: 2,
          ),
          ListTileWidget(
            title: 'Gift Card',
            icon: Icons.card_giftcard,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
