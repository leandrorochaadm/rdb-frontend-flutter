import 'package:flutter/material.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_page_crud.dart';
import 'package:rdb/pessoa/pessoa_page_list.dart';
import 'package:rdb/pessoa/pessoa_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rueiros do Bem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: PessoaPageList.tag,
      routes: {
        PessoaPageList.tag: (context) =>
            PessoaPageList(PessoaController(PessoaRepository())),
        PessoaPageCrud.tag: (context) =>
            PessoaPageCrud(PessoaController(PessoaRepository())),
      },
    );
  }
}
