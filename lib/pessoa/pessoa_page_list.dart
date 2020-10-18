import 'package:flutter/material.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';

class PessoaPageList extends StatelessWidget {
  const PessoaPageList({Key key}) : super(key: key);

  static final tag = "pessoa_list";

  @override
  Widget build(BuildContext context) {
    PessoaController controller = PessoaController();
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ListTile(
          title: Text("pessoa"),
        )
      ],
    );
  }
}
