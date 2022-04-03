class Customer {
  String? name;
  String? email;
  String? endereco;
  String? cpf;
  String? formaPagamento;
  String? password;

  Customer(
      {this.name,
      this.email,
      this.endereco,
      this.cpf,
      this.formaPagamento,
      this.password});

  Customer.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    endereco = json['endereco'];
    cpf = json['cpf'];
    formaPagamento = json['forma_pagamento'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['endereco'] = this.endereco;
    data['cpf'] = this.cpf;
    data['forma_pagamento'] = this.formaPagamento;
    data['password'] = this.password;
    return data;
  }
}
