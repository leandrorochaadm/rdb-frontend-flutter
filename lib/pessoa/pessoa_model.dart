import 'dart:convert';

class PessoaModel {
  int id;
  String nome;
  String email;
  String telefone;
  String senha;

  PessoaModel({
    this.id,
    this.nome,
    this.email,
    this.telefone,
    this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'senha': senha,
    };
  }

  factory PessoaModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PessoaModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      telefone: map['telefone'],
      senha: map['senha'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PessoaModel.fromJson(String source) =>
      PessoaModel.fromMap(json.decode(source));
}
