import 'package:delivery_food/modules/home/controllers/home_controller.dart';
import 'package:delivery_food/modules/home/view/components/search_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: SearchAppbarWidget(
          onChanged: (value) => HomeController.to.keyword(value),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            HomeController.to.refreshHome();
          },
          child: Obx(() {
            return ListView.builder(
              itemCount: HomeController.to.menuData.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  child: Text(
                    HomeController.to.menuData[index].name ?? '',
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
