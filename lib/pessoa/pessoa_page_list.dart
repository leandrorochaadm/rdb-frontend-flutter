import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_page_crud.dart';
import 'package:rdb/pessoa/pessoa_widget_tile.dart';

class PessoaPageList extends StatelessWidget {
  const PessoaPageList(this.controller, {Key key}) : super(key: key);

  static final tag = "pessoa_list";
  final PessoaController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(PessoaPageCrud.tag);
        },
        child: Icon(Icons.add),
      ),
      body: Observer(builder: (_) {
        var list = controller.listPessoas;

        if (list.error != null) {
          return Center(
            child: Text("Ocorreu um erro"),
          );
        }

        if (list.value == null) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: list.value.length,
          itemBuilder: (_, index) {
            var pessoa = list.value[index];
            return PessoaTile(pessoa);
          },
        );
      }),
    );
  }
}
