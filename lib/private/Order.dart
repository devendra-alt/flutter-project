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
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 17.2, bottom: 35.2),
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/title.jpeg'),
                    fit: BoxFit.fill,
                  )),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(1.0),
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                  ),
                ),
                Positioned(
                    bottom: 150,
                    left: 20,
                    child: RichText(
                        text: TextSpan(
                            text: "Lava Java",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25.5,
                            ))))
              ],
            ),
            Transform.translate(
                offset: Offset(0.0, -(height * 0.3 - height * 0.20)),
                child: Container(
                  width: width,
                  height: 700,
                  padding: EdgeInsets.only(top: 5),
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
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.2),
                          unselectedLabelColor: Colors.grey[600],
                          unselectedLabelStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.greenAccent,
                          tabs: <Widget>[
                            Tab(
                              child: Text("Espresso"),
                            ),
                            Tab(
                              child: Text("Frappuccino"),
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
                          height: 5,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 20.2, right: 20.2, bottom: 10.2),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 3),
                                  prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 15),
                                      child: Icon(
                                        Icons.search,
                                        size: 30,
                                      )),
                                  hintText: "search",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.grey[400]))),
                            )),
                        Container(
                          height: height * 0.6,
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
                ))
          ],
        ),
      ),
    ));
  }
}
