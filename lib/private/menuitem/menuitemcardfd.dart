import 'package:sign_up_app/private/pages/featured.dart';
import 'package:flutter/material.dart';
import '../model/coffeemodelfeatured.dart';

class menuitemcardfd extends StatelessWidget {
  final int index;
  menuitemcardfd({this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail_Page2(
                                index: index,
                              )));
                },
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            menu[index].img,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(width: 20),
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            menu[index].name,
                            style: TextStyle(
                              fontFamily: "Lemonada",
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "₹. " + menu[index].price.toString(),
                            style: TextStyle(
                              fontFamily: "Baloo2",

                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail_Page2(
                                  index: index,
                                )));
                  },
                  icon: Icon(
                    Icons.add_circle_sharp,
                    color: Colors.brown[500],
                    size: 36,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
