import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rdb/item/item_controller.dart';
import 'package:rdb/item/item_model.dart';
import 'package:rdb/item/item_page_crud.dart';
import 'package:rdb/item/item_widget_tile.dart';

class ItemPageList extends StatefulWidget {
  const ItemPageList({Key key}) : super(key: key);

  static final tag = "itemList";

  @override
  _ItemPageListState createState() => _ItemPageListState();
}

class _ItemPageListState extends State<ItemPageList> {
  @override
  Widget build(BuildContext context) {
    ItemController controller = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Itens Doação"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ItemPageCrud.tag);
        },
        child: Icon(Icons.add),
      ),
      body: Observer(builder: (_) {
        var list = controller.listItem;

        /* if (list.error != null) {
          return Center(
            child: Text("Ocorreu um erro"),
          );
        }*/

        if (list == null) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            ItemModel item = list[index];
            return ItemTile(item);
          },
        );
      }),
    );
  }
}
