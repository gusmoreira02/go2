import { ObjectId } from 'mongodb';
import connect from '../db/mongo';
import event from '../model/Event';

const COLLECTION = "evento";



async function findEvent(uId :string,event :event) {
    const db = await connect();
    
    const data = await db.collection<event>(COLLECTION).findOne( {$or:[{_id:new ObjectId(uId)},{ event}]}) as event;
    
    
    return data;
    
}
export{ findEvent };

async function findAllEvent() {
    const db = await connect();
    
    const data = await db.collection<event>(COLLECTION).find().toArray() as event[] ;
    
    console.log("a");
    return data;
    
}
export{ findAllEvent };
async function saveEvent(event :event) {
    const db = await connect();
    const data = await db.collection<event>(COLLECTION).insertOne(event);
    console.log(data);
    return data;
    
}
 
export{ saveEvent };
async function deleteEvent(event :event) {
    const db = await connect();
    
    const data = await db.collection<event>(COLLECTION).findOneAndDelete({_id : new ObjectId(event._id?.toString())}) ;
  
    return data;
    
}
export{ deleteEvent };

async function updateEvent(event :event) {
    const db = await connect();
    const {_id, ...filteredObject} = event;
    const updateDocument = {$set:filteredObject}
    const data = await db.collection(COLLECTION).updateOne({_id: new ObjectId(event._id?.toString())}, updateDocument) ;
    console.log(filteredObject);
    return data;
    
}
export{ updateEvent };


