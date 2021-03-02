class Product {
  final int id;
  final String name;
  final String img;
  final int price;
  bool weighted = false;
  double sold = 0.0;
  final int shopId;

  Product(this.id, this.name, this.img, this.price, this.shopId,
      {double sold, bool weighted}) {
    this.sold = sold;
    this.weighted = weighted;
  }

  static List<Product> products = [
    Product(0, 'Coca-cola', 'assets/img/product0.png', 50, 0, sold: 0.3),
    Product(1, 'Milka', 'assets/img/product1.png', 180, 0, sold: 0.3),
    Product(2, 'Nesquik Chocolat au lait - 33cl', 'assets/img/product2.png', 60, 0),
    Product(3, 'Indomi - special chicken', 'assets/img/product3.png', 35, 0),
    Product(4, 'Orange', 'assets/img/product4.png', 40, 0, weighted: true),
    Product(5, 'Nestle eau - 5 litres', 'assets/img/product5.png', 100, 0),
    Product(6, 'Rouiba excellence Orange - 33cl', 'assets/img/product6.png', 100, 0),
  ];
}
