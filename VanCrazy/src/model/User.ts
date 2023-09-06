import { ObjectId } from "mongodb";


export default class user {
    _id?: ObjectId
    cpf: string
    name: string
    lastName: string
    birthday: string
    email: string
    telefone: string
    senha: string
    documento: string
    genero: string
    foto?: string
    
    
    
    constructor(
        id: ObjectId,
        cpf: string,
        name: string,
        lastName: string,
        birthday: string,
        email: string,
        telefone: string,
        senha: string,
        documento: string,
        genero: string,
        foto: string
    ) {
        this._id = id
        this.cpf = cpf
        this.name = name
        this.lastName = lastName
        this.birthday = birthday
        this.email = email
        this.telefone = telefone
        this.senha = senha
        this.documento = documento
        this.genero = genero
        this.foto = foto
    }





}