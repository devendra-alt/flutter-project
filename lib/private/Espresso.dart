import 'package:sign_up_app/private/menuitem/Menuitem.dart';
import 'package:sign_up_app/private/model/coffeemodel.dart';
import 'package:flutter/material.dart';

class espressoCoffee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 500,
        child: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, int key) {
            return menuitemcard(index: key);
          },
        ));
  }
}
