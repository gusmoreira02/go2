import { ObjectId } from "mongodb";


export default class UserRide {
    _id?: ObjectId
    idUser: number
    idRide: number
    paymentStatus: string


    constructor(
        id: ObjectId,
        idUser: number,
        idRide: number,
        paymentStatus: string
    ) {
        this._id = id
        this.idUser = idUser
        this.idRide = idRide
        this.paymentStatus = paymentStatus
    }




}