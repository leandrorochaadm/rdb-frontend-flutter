import 'package:flutter/material.dart';
import 'package:rdb/pessoa/pessoa_repository.dart';

class PessoaPage extends StatelessWidget {
  const PessoaPage({Key key}) : super(key: key);

  static final tag = "pessoa";

  @override
  Widget build(BuildContext context) {
    final PessoaRepository repository = PessoaRepository();
    return Container(
      color: Colors.purpleAccent[200],
    );
  }
}
