import 'package:flutter/material.dart';
import 'package:rdb/cart/cart_page.dart';
import 'package:rdb/item/item_page_list.dart';
import 'package:rdb/pessoa/pessoa_page_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static const String tag = "homePage";

  @override
  Widget build(BuildContext context) {
    Widget buttonHome(String pageRoute, String textButton) {
      return Container(
        height: 60,
        width: 180,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(pageRoute);
          },
          child: Text(textButton),
        ),
      );
    }

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonHome(PessoaPageList.tag, "Lista de pessoas"),
          buttonHome(ItemPageList.tag, "Lista de itens"),
        ],
      ),
    );
  }
}
