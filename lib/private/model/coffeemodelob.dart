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
    img: "images/sign_hot_choc_2_tcm87-29587_w1024_n.jpeg",
    name: "Signature Hot Chocolate",
    price: "110",
    rate: 5,
    desc:
        "Signature Hot Chocolate is made with Starbucks® exclusive cocoa blend, steamed non-fat milk and topped with whipped cream. Hazelnut Signature Hot Chocolate is a classic and creamy combination of chocolate and hazelnut flavor, topped with whipped cream.",
  ),
];
