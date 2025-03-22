import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/modules/order/detail_order/controllers/detail_order_controller.dart';
import 'package:delivery_food/modules/order/detail_order/view/components/check_step.dart';
import 'package:delivery_food/modules/order/detail_order/view/components/uncheck_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTracker extends StatelessWidget {
  const OrderTracker({super.key});

  @override
  Widget build(BuildContext context) {
    var orderData = DetailOrderController.to.orderData.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your order is being prepared',
          style: AppStyle.f12TextW500Black,
          textAlign: TextAlign.left,
        ),
        18.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(flex: 10),
            Expanded(
              flex: 10,
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    orderData?.status == 0 || orderData?.status == 1,
                widgetBuilder: (context) => const CheckStep(),
                fallbackBuilder: (context) => const UncheckStep(),
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 42,
              child: Container(
                height: 4.r,
                color: Colors.black,
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 10,
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) => orderData?.status == 2,
                widgetBuilder: (context) => const CheckStep(),
                fallbackBuilder: (context) => const UncheckStep(),
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 42,
              child: Container(
                height: 4.r,
                color: Colors.black,
              ),
            ),
            const Spacer(flex: 3),
            Expanded(
              flex: 10,
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) => orderData?.status == 3,
                widgetBuilder: (context) => const CheckStep(),
                fallbackBuilder: (context) => const UncheckStep(),
              ),
            ),
            const Spacer(flex: 10),
          ],
        ),
        11.verticalSpacingRadius,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Order accepted',
                style: AppStyle.f12TextW500Black,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                'Please take your order',
                style: AppStyle.f12TextW500Black,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                'Order completed',
                style: AppStyle.f12TextW500Black,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
