import { ObjectId } from "mongodb";
import user from "./User";
export default class ride {
    _id?: ObjectId
    nomeCarona: string
    assentos: number
    valor: number
    partida: string
    destino: string
    data: string
    hPartida: string
    descricao: string
    foto?: string
    evento: number
    idResponsavel: number
    status: string
    nomeMotorista: string
    modelo: string
    placa: string
    users: user[]


    constructor(
        id: ObjectId,
        nomeCarona: string,
        assentos: number,
        valor: number,
        partida: string,
        destino: string,
        data: string,
        hPartida: string,
        descricao: string,
        foto: string,
        evento: number,
        idResponsavel: number,
        status: string,
        nomeMotorista: string,
        modelo: string,
        placa: string,
        users: user[]
    ) {
        this._id = id
        this.nomeCarona = nomeCarona
        this.assentos = assentos
        this.valor = valor
        this.partida = partida
        this.destino = destino
        this.data = data
        this.hPartida = hPartida
        this.descricao = descricao
        this.foto = foto
        this.evento = evento
        this.idResponsavel = idResponsavel
        this.status = status
        this.nomeMotorista = nomeMotorista
        this.modelo = modelo
        this.placa = placa
        this.users = users
    }
}