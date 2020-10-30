import 'package:flutter/material.dart';
import 'package:rdb/item/item_page_list.dart';
import 'package:rdb/pessoa/pessoa_page_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static const String tag = "homePage";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 60,
              width: 180,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(PessoaPageList.tag);
                },
                child: Text("Lista de pessoa"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 60,
              width: 180,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ItemPageList.tag);
                },
                child: Text("Lista de itens doação"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
