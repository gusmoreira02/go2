import { ObjectId } from 'mongodb';
import connect from '../db/mongo';
import userRide from '../model/LikedRide';
import LikedRide from '../model/LikedRide';

const COLLECTION = "curtida";



async function findLikeByUser(uId :string,userId :LikedRide) {
    const db = await connect();
    
    const data = await db.collection<LikedRide>(COLLECTION).find( {idUser :parseInt(uId)}).toArray() as userRide[];
    
    
    return data;
    
}
export{ findLikeByUser };

async function findLikeByRide(uId :string,rideId :LikedRide) {
    const db = await connect();
    
    const data = await db.collection<LikedRide>(COLLECTION).findOne( {idRide :parseInt(uId)}) as userRide;
    
    
    return data;
    
}
export{ findLikeByRide };


async function saveLike(likedRide :LikedRide) {
    const db = await connect();
    const data = await db.collection<LikedRide>(COLLECTION).insertOne(likedRide);
    console.log(data);
    return data;
    
}
 
export{ saveLike };
async function deleteLike(likedRide :LikedRide) {
    const db = await connect();
    
    const data = await db.collection<LikedRide>(COLLECTION).findOneAndDelete({_id : new ObjectId(likedRide._id?.toString())}) ;
  
    return data;
    
}
export{ deleteLike };

async function updateLike(likedRide :LikedRide) {
    const db = await connect();
    const {_id, ...filteredObject} = likedRide;
    const updateDocument = {$set:filteredObject}
    const data = await db.collection(COLLECTION).updateOne({_id: new ObjectId(likedRide._id?.toString())}, updateDocument) ;
    console.log(filteredObject);
    return data;
    
}
export{ updateLike };


