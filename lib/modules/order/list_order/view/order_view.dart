import 'package:delivery_food/modules/order/list_order/controllers/list_order_controller.dart';
import 'package:delivery_food/modules/order/list_order/view/components/list_order_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    var orderController = ListOrderController.to;
    return Scaffold(
      appBar: const ListOrderAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SmartRefresher(
          controller: orderController.refreshController,
        ),
      ),
    );
  }
}
