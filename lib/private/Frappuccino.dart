import 'package:sign_up_app/private/menuitem/menuitemcardfrapp.dart';
import 'package:flutter/material.dart';
import 'model/coffeemodelfrappuccino.dart';

class frappuccino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, int key) {
            return menuitemcardfrapp(index: key);
          }),
    );
  }
}