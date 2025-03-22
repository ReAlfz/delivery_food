import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/constants/data_const.dart';
import 'package:delivery_food/modules/order/list_order/controllers/list_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
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
            return InkWell(
              onTap: () => ListOrderController.to.pushToDetail(data.id!),
              borderRadius: BorderRadius.circular(10.r),
              child: Ink(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(111, 24, 24, 24),
                      blurRadius: 10,
                      spreadRadius: -1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Hero(
                          tag: 'order-${data.noReceipt}',
                          child: Container(
                            width: 124.w,
                            padding: EdgeInsets.all(10.r),
                            constraints: BoxConstraints(
                              minHeight: 124.h,
                              maxWidth: 124.w,
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              height: 75.h,
                              width: 75.w,
                              imageUrl: data.menu!.isNotEmpty
                                  ? data.menu!.first.image!
                                  : DataConst.noImage,
                              errorWidget: (context, url, error) {
                                return CachedNetworkImage(
                                  imageUrl: DataConst.noImage,
                                  fit: BoxFit.contain,
                                  height: 75.h,
                                  width: 75.w,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Flexible(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
                            Row(
                              children: [
                                ConditionalSwitch.single(
                                  context: context,
                                  valueBuilder: (context) => data.status,
                                  fallbackBuilder: (context) =>
                                      const SizedBox(),
                                  caseBuilders: {
                                    0: (context) => Icon(
                                          Icons.access_time,
                                          color: const Color(0xFFFFAC01),
                                          size: 16.r,
                                        ),
                                    1: (context) => Icon(
                                          Icons.access_time,
                                          color: const Color(0xFFFFAC01),
                                          size: 16.r,
                                        ),
                                    2: (context) => Icon(
                                          Icons.access_time,
                                          color: const Color(0xFFFFAC01),
                                          size: 16.r,
                                        ),
                                    3: (context) => Icon(
                                          Icons.check,
                                          color: const Color(0xFF009C48),
                                          size: 16.r,
                                        ),
                                    4: (context) => Icon(
                                          Icons.close,
                                          color: const Color(0xFFD81D1D),
                                          size: 16.r,
                                        ),
                                  },
                                ),
                                5.horizontalSpaceRadius,
                                Expanded(
                                  child: ConditionalSwitch.single(
                                    context: context,
                                    valueBuilder: (context) => data.status,
                                    fallbackBuilder: (context) =>
                                        const SizedBox(),
                                    caseBuilders: {
                                      0: (context) => Text(
                                            'In queue',
                                            style: Get.textTheme.labelMedium!
                                                .copyWith(
                                              color: const Color(0xFFFFAC01),
                                            ),
                                          ),
                                      1: (context) => Text(
                                            'Preparing',
                                            style: Get.textTheme.labelMedium!
                                                .copyWith(
                                              color: const Color(0xFFFFAC01),
                                            ),
                                          ),
                                      2: (context) => Text(
                                            'Ready',
                                            style: Get.textTheme.labelMedium!
                                                .copyWith(
                                              color: const Color(0xFFFFAC01),
                                            ),
                                          ),
                                      3: (context) => Text(
                                            'Completed',
                                            style: Get.textTheme.labelMedium!
                                                .copyWith(
                                              color: const Color(0xFF009C48),
                                            ),
                                          ),
                                      4: (context) => Text(
                                            'Canceled',
                                            style: Get.textTheme.labelMedium!
                                                .copyWith(
                                              color: const Color(0xFFD81D1D),
                                            ),
                                          ),
                                    },
                                  ),
                                ),
                                Text(
                                  ListOrderController.to
                                      .getDateFormat(data.date!),
                                  style: Get.textTheme.labelMedium!.copyWith(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            14.verticalSpace,
                            Text(
                              data.menu!
                                  .map((element) => element.name)
                                  .join(', '),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.f16TextW500Black,
                            ),
                            5.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Rp ${data.totalPrice}',
                                  style: AppStyle.f16TextW500Black.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                5.horizontalSpace,
                                Text(
                                  '(${data.menu?.length} Menu)',
                                  style: AppStyle.f16TextW500Black.copyWith(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      5.horizontalSpace,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
