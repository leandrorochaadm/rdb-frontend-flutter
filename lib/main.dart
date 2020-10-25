import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rdb/item/item_page_list.dart';

import 'item/item_controller.dart';
import 'item/item_page_crud.dart';
import 'item/item_repository.dart';
import 'pessoa/pessoa_controller.dart';
import 'pessoa/pessoa_page_crud.dart';
import 'pessoa/pessoa_page_list.dart';
import 'pessoa/pessoa_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PessoaController>.value(
            value: PessoaController(PessoaRepository())),
        Provider<ItemController>.value(value: ItemController(ItemRepository())),
      ],
      child: MaterialApp(
        title: 'Rueiros do Bem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: ItemPageList.tag,
        routes: {
          PessoaPageList.tag: (context) => PessoaPageList(),
          PessoaPageCrud.tag: (context) => PessoaPageCrud(),
          PessoaPageCrud.tag + "Params": (context) =>
              PessoaPageCrud(pessoa: ModalRoute.of(context).settings.arguments),
          //
          ItemPageList.tag: (context) => ItemPageList(),
          ItemPageCrud.tag: (context) => ItemPageCrud(),
          ItemPageCrud.tag + "Params": (context) => ItemPageCrud(
                item: ModalRoute.of(context).settings.arguments,
              ),
        },
      ),
    );
  }
}
