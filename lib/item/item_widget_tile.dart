import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rdb/cart/cart_manager.dart';
import 'package:rdb/cart/cart_page.dart';

import 'item_controller.dart';
import 'item_model.dart';
import 'item_page_crud.dart';

class ItemTile extends StatelessWidget {
  ItemTile({Key key, this.item}) : super(key: key);

  final ItemModel item;
  Color _color;

  @override
  Widget build(BuildContext context) {
    ItemController controller = Provider.of(context);
    _color = item.ativo == true
        ? Theme.of(context).primaryColor
        : Theme.of(context).disabledColor;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        isThreeLine: true,
        hoverColor: Theme.of(context).primaryColor.withAlpha(60),
        onTap: () {
          Navigator.pushNamed(context, ItemPageCrud.tag + "Params",
              arguments: item);
        },
        trailing: IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: _color,
          ),
          onPressed: item.ativo == true
              ? () {
                  context.read<CartManager>().addToCart(item);
                  Navigator.of(context).pushNamed(CartPage.tag);
                }
              : null,
        ),
        onLongPress: () {
          //TODO: criar msg se deseja realmente deletar item
          controller.deleteItem(item);
        },
        title: Text(
          item.nome,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: _color),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.valorReferencia.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: _color),
            ),
          ],
        ),
      ),
    );
  }
}
