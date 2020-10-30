import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rdb/cart/cart_manager.dart';
import 'package:rdb/cart/cart_page.dart';

import 'item_controller.dart';
import 'item_model.dart';
import 'item_page_crud.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(this.item, {Key key}) : super(key: key);
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    ItemController controller = Provider.of(context);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, ItemPageCrud.tag + "Params",
            arguments: item);
      },
      trailing: IconButton(
        icon: Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          context.read<CartManager>().addToCart(item);
          Navigator.of(context).pushNamed(CartPage.tag);
        },
      ),
      onLongPress: () {
        controller.deleteItem(item);
      },
      title: Text(
        item.nome,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            item.ativo == true ? "Ativo" : "Inativo",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            item.valorReferencia.toStringAsFixed(2),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
