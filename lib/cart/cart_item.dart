import 'package:rdb/item/item_model.dart';

class CartItem {
  CartItem.fromItem(this.item) {
    idItem = item.id;
    quantity = 1;
  }

  int idItem;
  int quantity;

  ItemModel item;

  num get valor {
    if (item == null) return 0;
    return item?.valorReferencia ?? 0;
  }
}
