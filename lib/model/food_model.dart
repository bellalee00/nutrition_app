class Food {
  String? id;
  String foto;
  String nama;
  int kalori;

  Food({this.id, required this.foto, required this.nama, required this.kalori});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        id: json['id'],
        foto: json['foto'],
        nama: json['nama'],
        kalori: json['kalori']);
  }

  Map<String, dynamic> toJson() {
    return {'foto': foto, 'nama': nama, 'kalori': kalori};
  }
}
