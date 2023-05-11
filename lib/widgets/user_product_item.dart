import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a1_1_20/provider/product_provider.dart';
import 'package:a1_1_20/models/product.dart';
import 'package:a1_1_20/routes/routes.dart';

class UserProductsItem extends StatelessWidget {
  String productName;
  double price;
  String imgUrl;
  String productid;

  UserProductsItem(
      {Key? key,
      required this.productName,
      required this.price,
      required this.imgUrl,
      required this.productid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductProvider>(context);
    Size _screenSize = MediaQuery.of(context).size;
    return ListTile(
      key: ValueKey(productid),
      leading: SizedBox(
        width: _screenSize.width * 0.15,
        child: Image.network(
          imgUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        productName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(price.toString()),
      trailing: SizedBox(
        width: _screenSize.width * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.indigo),
            ),
            IconButton(
              onPressed: () {
                product.removeProduct(productid);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
