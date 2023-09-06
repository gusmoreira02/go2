import { ObjectId } from "mongodb";


export default class event {
    _id?: ObjectId
    nome: string
    localizacao: string
    data: string
    dataFim: string
    descricao: string


    constructor(
        id: ObjectId,
        nome: string,
        localizacao: string,
        data: string,
        dataFim: string,
        descricao: string,
        foto: string
    ) {
        this._id = id
        this.nome = nome
        this.localizacao = localizacao
        this.data = data
        this.dataFim = dataFim
        this.descricao = descricao
        this.foto = foto
    } foto: string




}
