class eventos {
  String id = "";
  String nome = "";
  String localizacao = "";
  String data = "";
  String dataFim = "";
  String descricao = "";
  String foto = "";

 factory eventos.fromJson(Map<String, dynamic> json) {
 
    return eventos(
      
      id: json['_id'],
      nome: json['nome'],
      localizacao: json['localizacao'],
      data: json['data'],
      dataFim: json['dataFim'],
      descricao: json['descricao'],
      foto: json['foto'],
    );
    
  }
   eventos.fromeventos(
      
      
    );
   eventos({
    required this.id,
    required this.nome,
    required this.localizacao,
    required this.data,
    required this.dataFim,
    required this.descricao,
    required this.foto,
  });

}

