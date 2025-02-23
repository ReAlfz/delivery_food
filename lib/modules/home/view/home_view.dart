import 'package:delivery_food/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => HomeController.to.delete(),
          child: Text('delete'),
        ),
      ),
    );
  }
}
