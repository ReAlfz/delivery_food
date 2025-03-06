import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/modules/detail_menu/controllers/detail_menu_controller.dart';
import 'package:delivery_food/modules/detail_menu/view/components/menu_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToppingSheet extends StatefulWidget {
  const ToppingSheet({super.key});

  @override
  State<ToppingSheet> createState() => _ToppingSheetState();
}

class _ToppingSheetState extends State<ToppingSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.18.sh,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 5.h,
              width: 100.w,
              margin: EdgeInsets.only(top: 7.5.h),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(30.r)),
            ),
          ),
          15.verticalSpace,
          Text(
            'Select Topping',
            style: AppStyle.f18TextW500Black.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          24.verticalSpace,
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              itemCount:
                  DetailMenuController.to.detailMenu.value!.topping!.length,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => 15.horizontalSpace,
              itemBuilder: (context, index) {
                final data =
                    DetailMenuController.to.detailMenu.value!.topping![index];
                return MenuOptionsWidget(
                  text: data.name ?? '',
                  onTap: () => setState(() {
                    (DetailMenuController.to.selectedTopping.contains(data))
                        ? DetailMenuController.to.selectedTopping.remove(data)
                        : DetailMenuController.to.selectedTopping.add(data);
                  }),
                  isSelected: DetailMenuController.to.getSelected(data),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
