import 'package:mobx/mobx.dart';

import 'item_model.dart';
import 'item_repository.dart';
part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  final ItemRepository repository;

  _ItemControllerBase(this.repository) {
    setListItem();
  }

  @observable
  ObservableList<ItemModel> _listItem;

  @action
  void limparCampos() {
    _ativo = true;
    _id = null;
    _nome = "";
    _valor = 0;
  }

  @action
  Future<void> setListItem() async {
    _listItem = ObservableList<ItemModel>.of(await repository.listItem());
  }

  Future<void> atualizarDados() async {
    limparCampos();
    await setListItem();
  }

  @computed
  List<ItemModel> get listItem => _listItem;

  @observable
  int _id;

  @action
  void setId(int value) => _id = value;

  @computed
  int get id => _id;

  @observable
  String _nome = '';

  @action
  void setNome(String value) => _nome = value;

  @computed
  String get nome => _nome;
  bool get nomeIsValid => _nome.trim().length > 3;
  String get nomeError => nomeIsValid == true ? null : "Nome inválido";

  @observable
  double _valor = 0;

  @action
  void setValor(String value) => _valor = double.parse(value);

  @computed
  String get valor => _valor.toString();
  bool get valorIsValid => _valor > 0;
  String get valorError => valorIsValid == true ? null : "Valor inválido";

  @observable
  bool _ativo = true;

  @action
  void setAtivo(bool value) => _ativo = value;

  @computed
  bool get ativo => _ativo;

  @computed
  bool get allValid => nomeIsValid && valorIsValid;

  @action
  Future<bool> saveItem() async {
    bool status = await repository.setItem(
      ItemModel(
        ativo: _ativo,
        nome: _nome,
        valorReferencia: _valor,
      ),
    );
    await atualizarDados();
    return status;
  }

  @action
  Future<bool> updateItem() async {
    bool status = await repository.updateItem(
      ItemModel(
        id: _id,
        ativo: _ativo,
        nome: _nome,
        valorReferencia: _valor,
      ),
    );
    await atualizarDados();
    return status;
  }

  @action
  Future<bool> deleteItem(ItemModel item) async {
    var status = false;
    status = await repository.deleteItem(item);
    await atualizarDados();
    return status;
  }
}
