import 'package:flutter/material.dart';

import 'pessoa/pessoa_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rueiros do Bem',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: PessoaPage.tag,
        routes: {
          PessoaPage.tag: (context) => PessoaPage(),
        });
  }
}
