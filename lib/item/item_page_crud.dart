import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rdb/pessoa/pessoa_controller.dart';

import 'item_controller.dart';
import 'item_model.dart';

class ItemPageCrud extends StatefulWidget {
  const ItemPageCrud({this.item, Key key}) : super(key: key);

  static final tag = "itemCrud";
  final ItemModel item;

  @override
  _ItemPageCrudState createState() => _ItemPageCrudState();
}

class _ItemPageCrudState extends State<ItemPageCrud> {
  @override
  Widget build(BuildContext context) {
    ItemController controller = Provider.of(context);
    if (widget.item?.id != null) {
      controller.setId(widget.item.id);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadrastro de item"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool salvo = false;

          if (widget.item?.id != null) {
            salvo = await controller.updateItem();
          } else {
            salvo = await controller.saveItem();
          }

          if (salvo == true) {
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
                initialValue: widget.item?.nome,
                onChanged: controller.setNome,
                decoration: InputDecoration(
                    labelText: "Nome", errorText: controller.nomeError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                initialValue: widget.item?.valorReferencia.toString(),
                onChanged: controller.setValor,
                decoration: InputDecoration(
                    labelText: "Valor", errorText: controller.valorError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Checkbox(
                onChanged: controller.setAtivo,
                value: controller.ativo,
              ),
            )
            /*  Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                initialValue: widget.item?.ativo.toString(),
                onChanged: null,
                decoration: InputDecoration(
                  labelText: "Ativo",
                ),
              ),
            ),*/
          ],
        );
      }),
    );
  }
}
