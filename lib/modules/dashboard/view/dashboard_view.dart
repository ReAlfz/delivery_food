import 'package:delivery_food/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:delivery_food/modules/home/view/home_view.dart';
import 'package:delivery_food/modules/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        sizing: StackFit.expand,
        index: DashboardController.to.index.value,
        children: const [
          HomeView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
