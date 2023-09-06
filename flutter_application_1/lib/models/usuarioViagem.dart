
class usuarioViagem {
  String id = "";
  String idUser = "";
  String idRide = "";
  String paymentStatus = "";

 factory usuarioViagem.fromJson(Map<dynamic, dynamic> json) {

    return usuarioViagem(
      
      id: json['_id'],
      idUser: json['idUser'],
      idRide: json['idRide'],
      paymentStatus: json['paymentStatus'],
    );
  }
   usuarioViagem({
    required this.id,
    required this.idUser,
    required this.idRide,
    required this.paymentStatus,
  });

}

