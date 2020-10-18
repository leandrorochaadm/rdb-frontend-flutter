import 'package:flutter/material.dart';
import 'package:rdb/pessoa/pessoa_model.dart';

class PessoaTile extends StatelessWidget {
  const PessoaTile(this.pessoa, {Key key}) : super(key: key);
  final PessoaModel pessoa;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pessoa.nome),
      subtitle: Text(pessoa.email),
    );
  }
}
