import 'package:flutter/material.dart';
import 'package:rest/products.dart';
import 'details.dart';
class ProductList extends StatelessWidget {
  final List<Products> products;
  const ProductList({ Key? key, required this.products}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          itemCount: products == null ? 0 : products.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailWidget(products[index])),
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(products[index].name),
                      subtitle: Text(products[index].description),
                    ),
                  )
              );
          });
  }

}