import 'dart:convert';

import 'package:rdb/pessoa/pessoa_model.dart';

class ItemModel {
  int id;
  String nome;
  double valorReferencia;
  bool ativo;
  DateTime dataCriacao;
  PessoaModel autor;

  ItemModel({
    this.id,
    this.nome,
    this.valorReferencia,
    this.ativo,
    this.dataCriacao,
    this.autor,
  });

  ItemModel copyWith({
    int id,
    String nome,
    double valorReferencia,
    bool ativo,
    DateTime dataCriacao,
    ItemModel autor,
  }) {
    return ItemModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      valorReferencia: valorReferencia ?? this.valorReferencia,
      ativo: ativo ?? this.ativo,
      dataCriacao: dataCriacao ?? this.dataCriacao,
      autor: autor ?? this.autor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'valorReferencia': valorReferencia,
      'ativo': ativo,
      // 'dataCriacao': dataCriacao?.millisecondsSinceEpoch,
      'autor': autor?.toMap(),
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ItemModel(
      id: map['id'],
      nome: map['nome'],
      valorReferencia: map['valorReferencia'],
      ativo: map['ativo'],
      dataCriacao:
          null, //DateTime.fromMillisecondsSinceEpoch(map['dataCriacao']),
      autor: PessoaModel.fromMap(map['autor']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemModel(id: $id, nome: $nome, valorReferencia: $valorReferencia, ativo: $ativo, dataCriacao: $dataCriacao, autor: $autor)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ItemModel &&
        o.id == id &&
        o.nome == nome &&
        o.valorReferencia == valorReferencia &&
        o.ativo == ativo &&
        o.dataCriacao == dataCriacao &&
        o.autor == autor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        valorReferencia.hashCode ^
        ativo.hashCode ^
        dataCriacao.hashCode ^
        autor.hashCode;
  }
}
