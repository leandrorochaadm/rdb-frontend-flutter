import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_model.dart';
import 'package:rdb/pessoa/pessoa_page_crud.dart';

class PessoaTile extends StatelessWidget {
  const PessoaTile(this.pessoa, {Key key}) : super(key: key);
  final PessoaModel pessoa;

  @override
  Widget build(BuildContext context) {
    PessoaController controller = Provider.of(context);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, PessoaPageCrud.tag + "Params",
            arguments: pessoa);
      },
      onLongPress: () {
        controller.deletePessoa(pessoa);
      },
      title: Text(
        pessoa.nome,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pessoa.email,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            pessoa.telefone,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
