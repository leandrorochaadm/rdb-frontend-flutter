import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rdb/cart/cart_card.dart';
import 'package:rdb/cart/cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  static const String tag = "CartPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cesto"),
      ),
      body: Consumer<CartManager>(builder: (_, cartManager, __) {
        return ListView(
            children: cartManager.items
                .map((cartItem) => CartCard(cartItem: cartItem))
                .toList());
      }),
    );
  }
}
