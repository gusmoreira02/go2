import { Db, MongoClient } from "mongodb";
 
let singleton: Db;
 
export default async (): Promise<Db> => {
    if (singleton) return singleton;
 
    const client = new MongoClient("mongodb+srv://mongo:mongo@cluster0.eaqiblu.mongodb.net/?retryWrites=true&w=majority");
 
    await client.connect();
  
    singleton = client.db("teste");
 
    return singleton;
}