import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_widget_tile.dart';

class PessoaPageList extends StatelessWidget {
  const PessoaPageList({Key key}) : super(key: key);

  static final tag = "pessoa_list";

  @override
  Widget build(BuildContext context) {
    PessoaController controller = PessoaController();
    return Material(
      child: Observer(builder: (_) {
        return ListView(
            padding: const EdgeInsets.all(8),
            children:
                controller.listPessoas.map((e) => PessoaTile(e)).toList());
      }),
    );
  }
}
