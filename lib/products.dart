class Products {
  String? id;
  final String name;
  final String description;
  final String price;
  final String qty;
  String? updated;

  Products({  this.id, required this.name, required this.description, required this.price, required this.qty, this.updated });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      qty: json['qty'],
      updated: json['updated'],
    );
  }

}