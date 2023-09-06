import { ObjectId } from 'mongodb';
import connect from '../db/mongo';
import ride from '../model/Ride';
import user from '../model/User';
import { findUser } from './userController';

const COLLECTION = "carona";



async function findRide(uId :string,ride :ride) {
    const db = await connect();
    
    const data = await db.collection<ride>(COLLECTION).findOne( {$or:[{_id:new ObjectId(uId)},{ ride}]}) as ride;
    
    console.log(data.users);
    return data;
    
}
export{ findRide };

async function findAllRide() {
    const db = await connect();
    
    const data = await db.collection<ride>(COLLECTION).find().toArray() as ride[] ;
    
    console.log(data);
    return data;
    
}
export{ findAllRide };


async function saveRide(ride :ride) {
    const db = await connect();
    const data = await db.collection<ride>(COLLECTION).insertOne(ride);
    console.log(data);
    return data;
    
}
 
export{ saveRide };
async function deleteRide(ride :ride) {
    const db = await connect();
    
    const data = await db.collection<ride>(COLLECTION).findOneAndDelete({_id:new ObjectId(ride._id?.toString())}) ;
  
    return data.value;
    
}
export{ deleteRide };

async function updateRide(ride :ride) {
    const db = await connect();
    
    
    const {_id, ...filteredObject} = ride;
    const updateDocument = {$set:filteredObject}
    
    console.log(filteredObject);
    
    const data = await db.collection(COLLECTION).updateOne({_id: new ObjectId(ride._id?.toString())}, updateDocument  ) ;
    //console.log(dados);
    return data;
    
}
export{ updateRide };
