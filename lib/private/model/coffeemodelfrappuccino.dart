class Coffee {
  final String img;
  final String name;
  final String price;
  final String desc;
  final int rate;

  Coffee({this.img, this.name, this.price, this.desc, this.rate});
}

List<Coffee> menu = [
  Coffee(
    img: "images/white_mocha_frap_1_tcm87-29595_w1024_n.jpeg",
    name: "White Mocha Frappuccino",
    price: "130",
    rate: 5,
    desc:
        "A toasty holiday blend of wonder: Frappuccino® Roast coffee, milk, ice and flavors of caramelized white chocolate with a cheerful topping of whipped cream, festive holiday sugar sparkles and crispy white pearls.",
  ),
  Coffee(
    img: "images/espresso_frapp_tcm87-29591_w1024_n.jpeg",
    name: "Espresso Frappuccino",
    price: "200",
    rate: 5,
    desc:
        "Coffee is combined with a shot of espresso and milk, then blended with ice to give you a nice little jolt and lots of sipping joy.",
  ),
  Coffee(
    img: "images/caramel_frappichino_2_tcm87-29588_w1024_n.jpeg",
    name: "Caramel Frappuccino",
    price: "190",
    rate: 5,
    desc:
        "Caramel syrup meets coffee, milk and ice for a rendezvous in the blender, while whipped cream and buttery caramel sauce layer the love on top. To change things up, try it affogato-style with a hot espresso shot poured right over the top.",
  ),
  Coffee(
    img: "images/java_chip_frap_1_tcm87-29593_w1024_n.jpeg",
    name: "Java Chip Frappuccino",
    price: "110",
    rate: 5,
    desc:
        "We blend mocha sauce and Frappuccino® chips with coffee, milk and ice, then top it off with whipped cream and a mocha drizzle to bring you endless java joy.",
  ),
];
