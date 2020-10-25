import 'package:dio/dio.dart';
import 'package:rdb/item/item_model.dart';

class ItemRepository {
  var dio = Dio();

  ItemRepository() {
    getItem();
  }

  Future<List<ItemModel>> getItem() async {
    Response response = await dio.get('http://localhost:8080/itens');
    List<ItemModel> list = [];
    for (var json in (response.data as List)) {
      list.add(ItemModel.fromMap(json));
      //print(json);
    }
    //  print("repository: $list");
    return list;
  }

  Future<bool> setItem(ItemModel item) async {
    print("Salvar item: ${item.toString()}");
    try {
      Response response =
          await dio.post('http://localhost:8080/itens', data: item.toJson());
      return response.statusCode == 201;
    } catch (e) {
      print("Erro post item: $e");
      return false;
    }
  }

  Future<bool> updateItem(ItemModel item) async {
    print("Update item: ${item.toString()}");
    try {
      Response response = await dio
          .put('http://localhost:8080/itens/${item.id}', data: item.toJson());
      return response.statusCode == 200;
    } catch (e) {
      print("Erro put item: $e");
      return false;
    }
  }

  Future<bool> deleteItem(ItemModel item) async {
    // print("delete: $item");
    Response response =
        await dio.delete('http://localhost:8080/itens/${item.id}');
  }
}
