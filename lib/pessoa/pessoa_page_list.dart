import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_page_crud.dart';
import 'package:rdb/pessoa/pessoa_widget_tile.dart';

class PessoaPageList extends StatefulWidget {
  const PessoaPageList({Key key}) : super(key: key);

  static final tag = "pessoa_list";

  @override
  _PessoaPageListState createState() => _PessoaPageListState();
}

class _PessoaPageListState extends State<PessoaPageList> {
  @override
  Widget build(BuildContext context) {
    PessoaController controller = Provider.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(PessoaPageCrud.tag);
        },
        child: Icon(Icons.add),
      ),
      body: Observer(builder: (_) {
        var list = controller.listPessoas;

        /* if (list.error != null) {
          return Center(
            child: Text("Ocorreu um erro"),
          );
        }*/

        if (list == null) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            var pessoa = list[index];
            return PessoaTile(pessoa);
          },
        );
      }),
    );
  }
}
