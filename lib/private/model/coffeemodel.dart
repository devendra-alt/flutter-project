class Coffee {
  final String img;
  final String name;
  final String price;
  final int rate;
  final String desc;

  Coffee({this.img, this.name, this.price, this.rate, this.desc});
}

List<Coffee> menu = [
  Coffee(
    img: "images/vanilla_latte_1_tcm87-29634_w1024_n.jpeg",
    name: "Vanilla Latte",
    price: "150",
    rate: 5,
    desc:
        "Our dark,rich espresso balanced with vanilla flavored syrup,streamed milk and a light layer of foam",
  ),
  Coffee(
      img: "images/Cafe Latte.jpeg",
      name: "Cafe Latte",
      price: "170",
      desc:
          "A caffè latte is simply a shot or two of bold, tasty espresso with fresh, sweet steamed milk over it. Some prefer to add syrup or extra espresso to the recipe."),
  Coffee(
      img: "images/caramel_mocha_1_tcm87-29619_w1024_n.jpeg",
      name: "Caramel Mocha",
      price: "180",
      rate: 5,
      desc:
          "Mocha sauce and toffeenut syrup are combined with coffee and steamed milk, then topped with sweetened whipped cream, caramel drizzle and a blend of turbinado sugar and sea salt."),
  Coffee(
    img: "images/hazelnut_latte_1_tcm87-29627_w1024_n.jpeg",
    name: "Hazelnut Latte",
    price: "120",
    rate: 5,
    desc:"Our dark, rich espresso balanced with Hazelnut flavored syrup,steamed milk and a light layer of foam",
  ),
];
