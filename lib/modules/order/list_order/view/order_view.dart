import 'package:delivery_food/modules/order/list_order/view/components/list_history_order.dart';
import 'package:delivery_food/modules/order/list_order/view/components/list_order_appbar.dart';
import 'package:delivery_food/modules/order/list_order/view/components/list_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const ListOrderAppbar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TabBarView(
            children: [
              ListOrderWidget(),
              ListHistoryOrder(),
            ],
          ),
        ),
      ),
    );
  }
}
