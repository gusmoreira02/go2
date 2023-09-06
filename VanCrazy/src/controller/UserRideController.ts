import { ObjectId } from 'mongodb';
import connect from '../db/mongo';
import userRide from '../model/UserRide';

const COLLECTION = "usuariocorrida";



async function findRideByUser(uId :string,userId :userRide) {
    const db = await connect();
    
    
    
    
    const data = await db.collection<userRide>(COLLECTION).find( {"idUser":parseInt(uId)}).toArray() as userRide[];
    console.log(data);
    
    
    return data;
    
}
export{ findRideByUser };

async function findRideByRide(uId :string,rideId :userRide) {
    const db = await connect();
    
    const data = await db.collection<userRide>(COLLECTION).findOne( {"idRide":parseInt(uId)}) as userRide;
    
    
    return data;
    
}
export{ findRideByRide };


async function saveUserRide(userRide :userRide) {
    const db = await connect();
    const data = await db.collection<userRide>(COLLECTION).insertOne(userRide);
    console.log(data);
    return data;
    
}
 
export{ saveUserRide };
async function deleteUserRide(userRide :userRide) {
    const db = await connect();
    
    const data = await db.collection<userRide>(COLLECTION).findOneAndDelete({_id : new ObjectId(userRide._id?.toString())}) ;
  
    return data;
    
}
export{ deleteUserRide };

async function updateUserRide(userRide :userRide) {
    const db = await connect();
    const {_id, ...filteredObject} = userRide;
    const updateDocument = {$set:filteredObject}
    const data = await db.collection(COLLECTION).updateOne({_id: new ObjectId(userRide._id?.toString())}, updateDocument) ;
    console.log(filteredObject);
    return data;
    
}
export{ updateUserRide };


