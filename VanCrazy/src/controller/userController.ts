import { ObjectId } from 'mongodb';
import connect from '../db/mongo';
import user from '../model/User';

const COLLECTION = "usuario";



async function findUser(uId :string,user :user) {
    const db = await connect();
    
    const data = await db.collection<user>(COLLECTION).findOne( {$or:[{_id:new ObjectId(uId)},{ user}]}) as user;
    
    
    return data;
    
}
export{ findUser };


async function logar(email :string,senha :string) {
    const db = await connect();
    
    const data = await db.collection<user>(COLLECTION).findOne( {$and: [{email: email}, {senha: senha}]}) as user;
    
    
    return data;
    
}
export{ logar };


async function saveUser(user :user) {
    const db = await connect();
    const data = await db.collection<user>(COLLECTION).insertOne(user);
    console.log(data);
    return data;
    
}
 
export{ saveUser };
async function deleteUser(user :user) {
    const db = await connect();
    
    const data = await db.collection<user>(COLLECTION).findOneAndDelete({_id : new ObjectId(user._id?.toString())}) ;
  
    return data;
    
}
export{ deleteUser };

async function updateUser(user :user) {
    const db = await connect();
    const {_id, ...filteredObject} = user;
    const updateDocument = {$set:filteredObject}
    const data = await db.collection(COLLECTION).updateOne({_id: new ObjectId(user._id?.toString())}, updateDocument) ;
    console.log(filteredObject);
    return data;
    
}
export{ updateUser };
