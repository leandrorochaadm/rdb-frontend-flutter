import 'package:rdb/cart/cart_item.dart';
import 'package:rdb/item/item_model.dart';
import 'package:rdb/login/login_controller.dart';
import 'package:rdb/pessoa/pessoa_model.dart';

class CartManager {
  List<CartItem> items = [];
  PessoaModel user;

  void updateUser(LoginController loginController) {
    // user = loginController.login;
    items.clear();

    if (user != null) {
      _loadCartItems();
    }
  }

  _loadCartItems() {
    //carregar carrinho desse usuario
  }

  void addToCart(ItemModel item) {
    try {
      final e = items.firstWhere((p) => p.stackable(item));
      e.quantitade++;
    } catch (e) {
      items.add(CartItem.fromItem(item));
      //TODO: salvar enviar item do carrinho pro backend
    }
  }
}
