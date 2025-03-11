import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/modules/menu/detail_menu/controllers/detail_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoteSheet extends StatelessWidget {
  const NoteSheet({super.key});

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
            'Create Note',
            style: AppStyle.f18TextW500Black.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 58.h,
                  ),
                  child: TextFormField(
                    maxLength: 100,
                    controller: DetailMenuController.to.noteTextController,
                    style: AppStyle.f14TextW500Black,
                    decoration: InputDecoration(
                      hintText: 'add note',
                      hintStyle: AppStyle.f14TextW500Black,
                      contentPadding: EdgeInsets.only(bottom: 0.h),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColor.mintColor,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColor.mintColor,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              15.horizontalSpace,
              InkWell(
                onTap: () {
                  Get.back(
                    result: DetailMenuController.to.noteTextController.text,
                  );
                },
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: AppColor.whiteColor,
                    size: 22.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
