import 'package:delivery_food/modules/menu/list_menu/controllers/menu_controller.dart';
import 'package:delivery_food/modules/menu/list_menu/view/components/menu_item.dart';
import 'package:delivery_food/modules/menu/list_menu/view/components/search_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => searchFocus.requestFocus(),
    );
  }

  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            HomeController.to.searchList.clear();
          }
        },
        child: Scaffold(
          appBar: SearchAppbarWidget(
            enable: true,
            focusNode: searchFocus,
          ),
          body: Container(
            height: 1.sh,
            padding: EdgeInsets.fromLTRB(10.w, 16.h, 10.w, 0),
            child: Obx(
              () => ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: HomeController.to.searchList.length,
                separatorBuilder: (context, index) => 8.verticalSpace,
                itemBuilder: (context, index) {
                  final data = HomeController.to.searchList[index];
                  return MenuItem(menu: data);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
