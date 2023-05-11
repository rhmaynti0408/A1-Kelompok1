import 'package:a1_1_20/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a1_1_20/provider/product_provider.dart';

import '../../routes/routes.dart';
import '../../widgets/my_drawer.dart';
import '../../widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Products",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.addUserProduct),
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const Divider(),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(Routes.landingPage),
              child: const ListTile(
                leading: Icon(
                  Icons.person_2,
                  color: Colors.indigo,
                ),
                title: Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  UserProductsItem(
                    productid: products[index].id,
                    productName: products[index].productName,
                    price: products[index].price,
                    imgUrl: products[index].imageUrl,
                  ),
                  const Divider(),
                ],
              );
            }),
      ),
    );
  }
}
