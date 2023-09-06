import { ObjectId } from "mongodb";


export default class LikedRide {
    _id?: ObjectId
    idUser: number
    idRide: number
    


    constructor(
        id: ObjectId,
        idUser: number,
        idRide: number,
       
    ) {
        this._id = id
        this.idUser = idUser
        this.idRide = idRide
       
    }




}