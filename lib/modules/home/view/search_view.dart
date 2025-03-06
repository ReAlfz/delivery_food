import 'package:delivery_food/modules/home/view/components/search_appbar_widget.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: SearchAppbarWidget(
          enable: true,
          changed: (value) {},
        ),
        body: Container(),
      ),
    );
  }
}
