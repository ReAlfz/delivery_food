import 'package:delivery_food/modules/order/list_order/controllers/list_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ListOrderWidget extends StatelessWidget {
  const ListOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        controller: ListOrderController.to.refreshController,
        onRefresh: ListOrderController.to.onRefreshOrder,
        onLoading: ListOrderController.to.onLoadingOrder,
        enablePullUp: ListOrderController.to.getLoadMoreStatus,
        enablePullDown: true,
        child: ListView.separated(
          itemCount: ListOrderController.to.getCurrentList.length,
          separatorBuilder: (context, index) => 8.verticalSpace,
          itemBuilder: (context, index) {
            var data = ListOrderController.to.getCurrentList[index];
            return Container(
              child: Text(data.noReceipt ?? ''),
            );
          },
        ),
      ),
    );
  }
}
