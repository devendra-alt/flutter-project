import 'package:sign_up_app/public/landing.dart';

import 'Espresso.dart';
import 'FeaturedDrinks.dart';
import 'Frappuccino.dart';
import 'OtherBeverages.dart';
import 'package:flutter/material.dart';

class Orderp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Container(
                // margin: EdgeInsets.only(top: 17.2, bottom: 35.2),
                height: height * 0.3,
                width: width,
                child: Container(
                  margin: EdgeInsets.only(left: 50, top: 0),
                  height: 275,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage(
                        "images/logo.png",
                      ),
                    ),
                  ),
                )
                // child: Container(
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(colors: [
                //     Colors.black.withOpacity(0.0),
                //     Colors.black.withOpacity(0.0),
                //     Colors.black.withOpacity(0.1),
                //     Colors.black.withOpacity(0.5),
                //     Colors.black.withOpacity(1.0),
                //   ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                // ),
                ),

            Transform.translate(

                offset: Offset(0.0, 25.0),
                child:
            Container(
              // width: width,
              // height: 700,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.brown,
                      labelStyle: TextStyle(
                          fontFamily: "Baloo2",
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: TextStyle(
                          fontFamily: "Baloo2",
                          fontSize: 11.9,
                          fontWeight: FontWeight.normal),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.black,
                      tabs: <Widget>[
                        Tab(
                          child: Text("Espresso"),
                        ),
                        Tab(
                          child: Text("Frappé"),
                        ),
                        Tab(
                          child: Text("Other Beverages"),
                        ),
                        Tab(
                          child: Text("Featured Drinks"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20.2, right: 20.2, bottom: 10.2),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 3),
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 15),
                                  child: Icon(
                                    Icons.search,
                                    size: 27,
                                  )),
                              hintText: "Search",
                              hintStyle: TextStyle(fontFamily: "Pacifico"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.grey[400]))),
                        )),
                    Container(
                      height: height * 0.4,
                      child: TabBarView(
                        children: <Widget>[
                          espressoCoffee(),
                          frappuccino(),
                          otherbeverages(),
                          featureddrinks(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
            )
          ],
        ),
      ),
    ));
  }
}
