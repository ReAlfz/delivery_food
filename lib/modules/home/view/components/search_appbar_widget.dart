import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:delivery_food/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final bool enable;
  final FocusNode? focusNode;
  const SearchAppbarWidget({
    super.key,
    required this.enable,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (!enable) ? HomeController.to.goToSearch : null,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(111, 24, 24, 24),
                blurRadius: 15,
                spreadRadius: -1,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            children: [
              if (enable) ...[
                InkWell(
                  onTap: () {
                    HomeController.to.searchList.clear();
                    Get.back();
                  },
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: AppColor.primaryColor,
                    size: 28.r,
                  ),
                ),
                8.horizontalSpace,
              ],
              Expanded(
                child: Hero(
                  tag: 'search_input',
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      style: AppStyle.f12TextW500Black,
                      enabled: enable,
                      onChanged: HomeController.to.onSearch,
                      focusNode: focusNode,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Search Menu',
                        isDense: true,
                        maintainHintHeight: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: AppColor.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: AppColor.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        suffixIcon: (enable)
                            ? Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(16.r),
                                  ),
                                ),
                                child: Icon(
                                  Icons.search,
                                  size: 26.r,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                        prefixIcon: (!enable)
                            ? Icon(
                                Icons.search,
                                size: 26.r,
                                color: Colors.grey,
                              )
                            : null,
                        hintStyle: AppStyle.f12TextW500Black.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
