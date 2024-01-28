class carona{
  String? id = '';
  String nomeCarona = "";
  int assentos =0;
  double valor =0.0;
  String partida = "";
  String destino = "";
  String data = "";
  String hPartida = "";
  String descricao = "";
  String foto = "";
  String? evento = "";
  String idResponsavel= "";
  String status = "";
  String nomeMotorista= "";
  String modelo = "";
  String placa = "";
      carona({
         this.id,
    required this.nomeCarona,
    required this.assentos,
    required this.valor,
    required this.partida,
    required this.destino,
    required this.data,
    required this.hPartida,
    required this.descricao,
    required this.foto,
    required this.evento,
    required this.idResponsavel,
    required this.status,
    required this.nomeMotorista,
    required this.modelo,
    required this.placa,
    
  });
  Map<String,String> toJson(){
return {
  "nomeCarona":this.nomeCarona,
  "assentos":this.assentos.toString(),
  "valor":this.valor.toString(),
  "partida":this.partida,
  "destino":this.destino,
  "data":this.data,
  "hPartida":this.hPartida,
  "descricao":this.descricao,
  "foto":this.foto as String,
  "evento":this.evento as String,
  "idResponsavel":this.idResponsavel,
  "status":this.status,
  "nomeMotorista":this.nomeMotorista,
  "modelo":this.modelo,
  "placa":this.placa,
};

  }
    factory carona.fromJson(Map<String, dynamic> json){
return carona(
   id: json['_id'],
nomeCarona: json['nomeCarona'],
 assentos: int.parse(json['assentos']),
  valor: double.parse(json['valor']),
  partida: json['partida'],
   destino: json['destino'],
    data: json['data'],
     hPartida: json['hPartida'],
      descricao: json['descricao'],
      foto: json['foto'],
       evento: json['evento'],
        idResponsavel: json['idResponsavel'],
         status: json['status'],
          nomeMotorista: json['nomeMotorista'],
           modelo: json['modelo'],
            placa: json['placa']);
            

  }

}