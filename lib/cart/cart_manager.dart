import 'package:flutter/material.dart';
import 'package:rdb/cart/cart_item.dart';
import 'package:rdb/item/item_model.dart';
import 'package:rdb/login/login_controller.dart';
import 'package:rdb/pessoa/pessoa_model.dart';

class CartManager extends ChangeNotifier {
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
    _onItemUpdated();
  }

  void addToCart(ItemModel item) {
    try {
      final e = items.firstWhere((p) => p.stackable(item));
      e.increment();
    } catch (e) {
      final cartItem = CartItem.fromItem(item);
      cartItem.addListener(_onItemUpdated);
      items.add(cartItem);
      //TODO: salvar enviar item do carrinho pro backend
    }
  }

  void _onItemUpdated() {
    for (int i = 0; i < items.length; i++) {
      final cartItem = items[i];
      print("list: $cartItem");
      if (cartItem.quantitade == 0) {
        removeOfCart(cartItem);
        i--;
        continue;
      }

      _updateCartItem(cartItem);
    }
  }

  void _updateCartItem(CartItem cartItem) {
// TODO: atualizar item no backend
  }

  void removeOfCart(CartItem cartItem) {
    print("deletando $cartItem");
    items.removeWhere((p) => p.idItem == cartItem.idItem);

    //remove listerner pra não desperdiçar recurso
    cartItem.removeListener(_onItemUpdated);
    notifyListeners();

    //TODO: deletar item no backend
  }
}
