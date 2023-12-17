class Drink {
  String? id;
  String foto;
  String nama;
  int kalori;

  Drink(
      {this.id, required this.foto, required this.nama, required this.kalori});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
        id: json['id'],
        foto: json['foto'],
        nama: json['nama'],
        kalori: json['kalori']);
  }

  Map<String, dynamic> toJson() {
    return {'foto': foto, 'nama': nama, 'kalori': kalori};
  }
}
