class Usuario{
  String id = "";
  String cpf = "";
  String name = "";
  String lastName = "";
  String birthday = "";
  String email = "";
  String telefone = "";
  String senha = "";
  String genero = "";
  String? foto = "";

factory Usuario.fromJson(Map<String, dynamic> json) {
 
    return Usuario(
      
      id: json['_id'],
      cpf: json['cpf'],
      name: json['name'],
      lastName: json['lastName'],
      birthday: json['birthday'],
      email: json['email'],
      telefone: json['telefone'],
      senha: json['senha'],
      genero: json['genero'],
      foto: json['foto'],
    );
    
  }
   Usuario.fromUsuario(
      
      
    );
   Usuario({
    required this.id,
    required this.cpf,
    required this.name,
    required this.lastName,
    required this.birthday,
    required this.email,
    required this.telefone,
    required this.senha,
    required this.genero,
    required this.foto,
  });

  Map<String,String> toJson(){
return {
  "_id":this.id,
  "cpf":this.cpf,
  "name":this.name,
  "lastName":this.lastName,
  "birthday":this.birthday,
  "email":this.email,
  "telefone":this.telefone,
  "senha":this.senha,
  "genero":this.genero,
  "foto":this.foto as String,
};

  }

}