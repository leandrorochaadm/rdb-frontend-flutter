import 'package:flutter/material.dart';
import 'package:rdb/item/item_model.dart';

class CartItem extends ChangeNotifier {
  CartItem.fromItem(this.item) {
    this.item = item;
    quantitade = 1;
  }

  int quantitade;
  ItemModel item;

  int get idItem => item.id;
  num get valor {
    if (item == null) return 0;
    return item?.valorReferencia ?? 0;
  }

  bool stackable(ItemModel itemModel) {
    return itemModel.id == idItem;
  }

  void increment() {
    quantitade++;
    notifyListeners();
  }

  void decrement() {
    quantitade--;
    notifyListeners();
  }

  double get priceItem => quantitade * item.valorReferencia;

  @override
  String toString() {
    return "Item: ${item.nome}, valor: ${item.valorReferencia.toStringAsFixed(2)}, quant: $quantitade";
  }
}
