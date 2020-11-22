import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rdb/cart/cart_manager.dart';
import 'package:rdb/cart/cart_page.dart';
import 'package:rdb/home/home_page.dart';
import 'package:rdb/item/item_page_list.dart';
import 'package:rdb/login/login_controller.dart';

import 'item/item_controller.dart';
import 'item/item_page_crud.dart';
import 'item/item_repository.dart';
import 'login/login_page.dart';
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
        Provider(
          create: (_) => LoginController(),
          lazy: false,
        ),
        Provider<ItemController>.value(value: ItemController(ItemRepository())),
        ChangeNotifierProxyProvider<LoginController, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, loginController, cartManager) =>
              cartManager..updateUser(loginController),
        )
      ],
      child: MaterialApp(
        title: 'Rueiros do Bem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          buttonColor: Colors.orange,
          disabledColor: Colors.orange.withAlpha(100),
        ),
        initialRoute: CartPage.tag,
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
          HomePage.tag: (context) => HomePage(),
          CartPage.tag: (context) => CartPage(),
          LoginPage.tag: (context) => LoginPage(),
        },
      ),
    );
  }
}
