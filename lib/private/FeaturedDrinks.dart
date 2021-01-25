import 'package:sign_up_app/private/menuitem/menuitemcardfd.dart';
import 'package:sign_up_app/private/model/coffeemodelfeatured.dart';
import 'package:flutter/material.dart';

class featureddrinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, int key) {
            return menuitemcardfd(index: key);
          }),
    );
  }
}
