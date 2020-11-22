import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rdb/cart/cart_manager.dart';

class TotalPriceCard extends StatelessWidget {
  const TotalPriceCard({
    Key key,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cartManager = context.watch<CartManager>();
    final total = cartManager.total;

    return Container(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Resumo do pedido',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Subtotal'),
                  Text('R\$ ${total.toStringAsFixed(2)}'),
                ],
              ),
              const Divider(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'R\$ ${total.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                disabledColor: Theme.of(context).disabledColor,
                textColor: Colors.white,
                disabledTextColor: Colors.white,
                onPressed: onPressed,
                child: Text(buttonText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
