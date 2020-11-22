import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rdb/cart/cart_item.dart';
import 'package:rdb/common/custom_icon_button.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    this.cartItem,
    Key key,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartItem,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      Text(
                        cartItem.item.nome,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Valor de Referência: R\$ ${cartItem.valor.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<CartItem>(builder: (_, cartItem, __) {
                return Column(
                  children: [
                    CustomIconButton(
                      iconData: Icons.add,
                      color: Theme.of(context).primaryColor,
                      onTap: cartItem.increment,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "${cartItem.quantitade}",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    CustomIconButton(
                      iconData:
                          cartItem.quantitade > 1 ? Icons.remove : Icons.delete,
                      color: cartItem.quantitade > 1
                          ? Theme.of(context).primaryColor
                          : Colors.red,
                      onTap: cartItem.decrement,
                    ),
                  ],
                );
              })
            ],

            //
          ),
        ),
      ),
    );
  }
}
