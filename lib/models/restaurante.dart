class Restaurante {
  String name;
  List<String> horario;
  String endereco;
  List<String> bebidas;
  List<String> cardapio;
  double latitude;
  double longitude;

  Restaurante(
      {this.name,
        this.horario,
        this.endereco,
        this.bebidas,
        this.cardapio,
        this.latitude,
        this.longitude});

  Restaurante.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    horario = json['horario'].cast<String>();
    endereco = json['endereco'];
    bebidas = json['bebidas'].cast<String>();
    cardapio = json['cardapio'].cast<String>();
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['horario'] = this.horario;
    data['endereco'] = this.endereco;
    data['bebidas'] = this.bebidas;
    data['cardapio'] = this.cardapio;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}