import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_repository.dart';

class PessoaPage extends StatelessWidget {
  const PessoaPage({Key key}) : super(key: key);

  static final tag = "pessoa";

  @override
  Widget build(BuildContext context) {
    PessoaController controller = PessoaController();
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextField(
            onChanged: controller.setNome,
            decoration: InputDecoration(
                labelText: "Nome", errorText: controller.nomeError),
          ),
        ),
      ],
    );
  }
}
