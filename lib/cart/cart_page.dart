import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rdb/cart/cart_card.dart';
import 'package:rdb/cart/cart_manager.dart';
import 'package:rdb/common/total_price_card.dart';
import 'package:rdb/item/item_page_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  static const String tag = "CartPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cesto de doações"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ItemPageList.tag);
            },
            child: Icon(Icons.add)),
        body: Consumer<CartManager>(builder: (_, cartManager, __) {
          return ListView(
            children: [
              Column(
                children: cartManager.items
                    .map((cartItem) => CartCard(cartItem: cartItem))
                    .toList(),
              ),
              TotalPriceCard(
                buttonText: 'Fechar sacola',
                onPressed: cartManager.items.length > 0 ? () {} : null,
              ),
            ],
          );
        }));
  }
}
