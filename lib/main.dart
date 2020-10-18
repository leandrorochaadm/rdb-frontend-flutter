import 'package:flutter/material.dart';

import 'pessoa/pessoa_page_crud.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rueiros do Bem',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: PessoaPage.tag,
        routes: {
          PessoaPage.tag: (context) => PessoaPage(),
        });
  }
}
