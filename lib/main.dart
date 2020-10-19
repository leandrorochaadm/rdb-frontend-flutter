import 'package:flutter/material.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_page_crud.dart';
import 'package:rdb/pessoa/pessoa_page_list.dart';
import 'package:rdb/pessoa/pessoa_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PessoaController>.value(
          value: PessoaController(PessoaRepository()),
        )
      ],
      child: MaterialApp(
        title: 'Rueiros do Bem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: PessoaPageList.tag,
        routes: {
          PessoaPageList.tag: (context) => PessoaPageList(),
          PessoaPageCrud.tag: (context) => PessoaPageCrud(),
        },
      ),
    );
  }
}
