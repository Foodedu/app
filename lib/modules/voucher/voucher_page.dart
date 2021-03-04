import 'package:flutter/material.dart';
import 'package:food/common/widgets/app_bar_widget.dart';
import 'package:food/common/widgets/ticket_widget.dart';
import '../../models/voucher.dart';

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  var voucher = Voucher();
  @override
  void initState() {
    super.initState();
    voucher
      ..title = 'Black fries day'
      ..description = 'All black fries'
      ..code = 'BFS324'
      ..percent = 50
      ..expiredTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Vouchers',
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TicketWidget(
                voucher: voucher,
                onTap: () {
                  print('tap voucher');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
