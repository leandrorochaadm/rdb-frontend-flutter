import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';
import 'package:rdb/pessoa/pessoa_model.dart';

class PessoaPageCrud extends StatefulWidget {
  const PessoaPageCrud({this.pessoa, Key key}) : super(key: key);

  static final tag = "pessoaCrud";
  final PessoaModel pessoa;

  @override
  _PessoaPageCrudState createState() => _PessoaPageCrudState();
}

class _PessoaPageCrudState extends State<PessoaPageCrud> {
  @override
  Widget build(BuildContext context) {
    PessoaController controller = Provider.of(context);
    if (widget.pessoa.id != null) {
      controller.setId(widget.pessoa.id);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadrastro de pessoa"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool salvo = false;

          if (widget.pessoa.id != null) {
            salvo = await controller.updatePessoa();
          } else {
            salvo = await controller.savePessoa();
          }

          if (salvo) {
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
              child: TextFormField(
                initialValue: widget.pessoa?.nome,
                onChanged: controller.setNome,
                decoration: InputDecoration(
                    labelText: "Nome", errorText: controller.nomeError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                initialValue: widget.pessoa?.email,
                onChanged: controller.setEmail,
                decoration: InputDecoration(
                    labelText: "Email", errorText: controller.emailError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                initialValue: widget.pessoa?.telefone,
                onChanged: controller.setTelefone,
                decoration: InputDecoration(
                    labelText: "Telefone", errorText: controller.telefoneError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                initialValue: widget.pessoa?.senha,
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
