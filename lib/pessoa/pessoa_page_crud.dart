import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';

class PessoaPageCrud extends StatefulWidget {
  const PessoaPageCrud({Key key}) : super(key: key);

  static final tag = "pessoaCrud";

  @override
  _PessoaPageCrudState createState() => _PessoaPageCrudState();
}

class _PessoaPageCrudState extends State<PessoaPageCrud> {
  @override
  Widget build(BuildContext context) {
    PessoaController controller = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadrastro de pessoa"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await controller.savePessoa()) {
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.save),
      ),
      body: Observer(builder: (_) {
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                onChanged: controller.setEmail,
                decoration: InputDecoration(
                    labelText: "Email", errorText: controller.emailError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                onChanged: controller.setTelefone,
                decoration: InputDecoration(
                    labelText: "Telefone", errorText: controller.telefoneError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextField(
                onChanged: controller.setSenha,
                decoration: InputDecoration(
                    labelText: "Senha", errorText: controller.senhaError),
              ),
            ),
          ],
        );
      }),
    );
  }
}
