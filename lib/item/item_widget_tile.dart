import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_controller.dart';
import 'item_model.dart';
import 'item_page_crud.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(this.item, {Key key}) : super(key: key);
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    ItemController controller = Provider.of(context);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, ItemPageCrud.tag + "Params",
            arguments: item);
      },
      onLongPress: () {
        controller.deleteItem(item);
      },
      title: Text(
        item.nome,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.ativo.toString(),
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            item.autor.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
