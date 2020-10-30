import 'package:rdb/cart/cart_item.dart';
import 'package:rdb/item/item_model.dart';

class CartManager {
  List<CartItem> items = [];

  void addToCart(ItemModel item) {
    items.add(CartItem.fromItem(item));
  }
}
