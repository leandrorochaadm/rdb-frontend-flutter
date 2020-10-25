// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemControllerBase, Store {
  Computed<List<ItemModel>> _$listItemComputed;

  @override
  List<ItemModel> get listItem =>
      (_$listItemComputed ??= Computed<List<ItemModel>>(() => super.listItem,
              name: '_ItemControllerBase.listItem'))
          .value;
  Computed<int> _$idComputed;

  @override
  int get id => (_$idComputed ??=
          Computed<int>(() => super.id, name: '_ItemControllerBase.id'))
      .value;
  Computed<bool> _$nomeIsValidComputed;

  @override
  bool get nomeIsValid =>
      (_$nomeIsValidComputed ??= Computed<bool>(() => super.nomeIsValid,
              name: '_ItemControllerBase.nomeIsValid'))
          .value;
  Computed<bool> _$valorIsValidComputed;

  @override
  bool get valorIsValid =>
      (_$valorIsValidComputed ??= Computed<bool>(() => super.valorIsValid,
              name: '_ItemControllerBase.valorIsValid'))
          .value;
  Computed<bool> _$ativoComputed;

  @override
  bool get ativo => (_$ativoComputed ??=
          Computed<bool>(() => super.ativo, name: '_ItemControllerBase.ativo'))
      .value;
  Computed<bool> _$allValidComputed;

  @override
  bool get allValid =>
      (_$allValidComputed ??= Computed<bool>(() => super.allValid,
              name: '_ItemControllerBase.allValid'))
          .value;

  final _$_listItemAtom = Atom(name: '_ItemControllerBase._listItem');

  @override
  ObservableList<ItemModel> get _listItem {
    _$_listItemAtom.reportRead();
    return super._listItem;
  }

  @override
  set _listItem(ObservableList<ItemModel> value) {
    _$_listItemAtom.reportWrite(value, super._listItem, () {
      super._listItem = value;
    });
  }

  final _$_idAtom = Atom(name: '_ItemControllerBase._id');

  @override
  int get _id {
    _$_idAtom.reportRead();
    return super._id;
  }

  @override
  set _id(int value) {
    _$_idAtom.reportWrite(value, super._id, () {
      super._id = value;
    });
  }

  final _$_nomeAtom = Atom(name: '_ItemControllerBase._nome');

  @override
  String get _nome {
    _$_nomeAtom.reportRead();
    return super._nome;
  }

  @override
  set _nome(String value) {
    _$_nomeAtom.reportWrite(value, super._nome, () {
      super._nome = value;
    });
  }

  final _$_valorAtom = Atom(name: '_ItemControllerBase._valor');

  @override
  double get _valor {
    _$_valorAtom.reportRead();
    return super._valor;
  }

  @override
  set _valor(double value) {
    _$_valorAtom.reportWrite(value, super._valor, () {
      super._valor = value;
    });
  }

  final _$_ativoAtom = Atom(name: '_ItemControllerBase._ativo');

  @override
  bool get _ativo {
    _$_ativoAtom.reportRead();
    return super._ativo;
  }

  @override
  set _ativo(bool value) {
    _$_ativoAtom.reportWrite(value, super._ativo, () {
      super._ativo = value;
    });
  }

  final _$setListItemAsyncAction =
      AsyncAction('_ItemControllerBase.setListItem');

  @override
  Future<void> setListItem() {
    return _$setListItemAsyncAction.run(() => super.setListItem());
  }

  final _$saveItemAsyncAction = AsyncAction('_ItemControllerBase.saveItem');

  @override
  Future<bool> saveItem() {
    return _$saveItemAsyncAction.run(() => super.saveItem());
  }

  final _$updateItemAsyncAction = AsyncAction('_ItemControllerBase.updateItem');

  @override
  Future<bool> updateItem() {
    return _$updateItemAsyncAction.run(() => super.updateItem());
  }

  final _$deleteItemAsyncAction = AsyncAction('_ItemControllerBase.deleteItem');

  @override
  Future<bool> deleteItem(ItemModel item) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(item));
  }

  final _$_ItemControllerBaseActionController =
      ActionController(name: '_ItemControllerBase');

  @override
  void setId(int value) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor(String value) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.setValor');
    try {
      return super.setValor(value);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAtivo(bool value) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.setAtivo');
    try {
      return super.setAtivo(value);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItem: ${listItem},
id: ${id},
nomeIsValid: ${nomeIsValid},
valorIsValid: ${valorIsValid},
ativo: ${ativo},
allValid: ${allValid}
    ''';
  }
}
