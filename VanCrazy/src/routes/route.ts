import express, { Request, Response } from "express";

import {deleteUser, findUser, logar, saveUser, updateUser} from "../controller/userController"
import user from "../model/User";
import ride from "../model/Ride";
import event from "../model/Event";
import userRide from "../model/UserRide";
import { deleteRide, findAllRide, findRide,  saveRide, updateRide } from "../controller/rideController";
import { deleteEvent, findAllEvent, findEvent, saveEvent, updateEvent } from "../controller/eventController";
import { deleteUserRide, findRideByRide, findRideByUser, saveUserRide, updateUserRide } from "../controller/UserRideController";
import { deleteLike, findLikeByRide, findLikeByUser, saveLike, updateLike } from "../controller/likedRideController";
import LikedRide from "../model/LikedRide";
export const route = express.Router();

//user @@@
route.get("/user", async (_req: Request, res: Response) => {
  var usuario = _req.body as user
  if((_req.query['_id']) != undefined || _req.query['email'] != undefined){
 res.status(200).send( await findUser(_req.query['_id'] as string,usuario));
  }else if(_req.query['_id'] == undefined){
    res.status(200).send( '{"erro":"sem id"}');
  }else{
    res.status(200).send( '{"erro":"sem email"}');

  }
  
});

route.get("/user/logar", async (_req: Request, res: Response) => {
  var usuario = _req.body as user
  if( _req.query['email'] != undefined && _req.query['senha'] != undefined){
 res.status(200).send( await logar(_req.query['email'] as string, _req.query['senha'] as string));
  }else{
    res.status(200).send( '{"erro":"sem credenciais"}');
  }
  
});


route.post("/user", async (_req: Request, res: Response) => {
  var usario  =  _req.body as user;
  res.status(200).send( await saveUser(usario));
   
 });
 route.put("/user", async (_req: Request, res: Response) => {
  var usario  =  _req.body as user;
  res.status(200).send( await updateUser(usario));
   
 });
 route.delete("/user", async (_req: Request, res: Response) => {
  var usario  =  _req.body as user;
  res.status(200).send( await deleteUser(usario));
   
 });

//@@@

//carona @@@
route.get("/ride", async (_req: Request, res: Response) => {
  var ride = _req.body as ride
  if((_req.query['_id']) != undefined){
 res.status(200).send( await findRide(_req.query['_id'] as string,ride));
  }else{
    
    res.status(200).send( await findAllRide());
  }
  
});

route.post("/ride", async (_req: Request, res: Response) => {
  var ride = _req.body as ride
  console.log('a');
  console.log(_req.body);
  console.log('b');
  res.status(200).send( await saveRide(ride));
   
 });
 route.put("/ride", async (_req: Request, res: Response) => {
  var ride = _req.body as ride
  res.status(200).send( await updateRide(ride));
   
 });
 route.delete("/ride", async (_req: Request, res: Response) => {
  var ride = _req.body as ride
  res.status(200).send( await deleteRide(ride));
   
 });

//@@@

//evento @@@
route.get("/event", async (_req: Request, res: Response) => {
  var event = _req.body as event
  if((_req.query['_id']) != undefined){
 res.status(200).send( await findEvent(_req.query['_id'] as string,event));
  }else{
    res.status(200).send( await findAllEvent());
  }
  
});

route.post("/event", async (_req: Request, res: Response) => {
  var event = _req.body as event
  res.status(200).send( await saveEvent(event));
   
 });
 route.put("/event", async (_req: Request, res: Response) => {
  var event = _req.body as event
  res.status(200).send( await updateEvent(event));
   
 });
 route.delete("/event", async (_req: Request, res: Response) => {
  var event = _req.body as event
  res.status(200).send( await deleteEvent(event));
   
 });

//@@@

//UserRide @@@
route.get("/userride/user", async (_req: Request, res: Response) => {
  var userId = _req.body as userRide
  if((_req.query['_id']) != undefined){
 res.status(200).send( await findRideByUser(_req.query['_id'] as string,userId));
}else{
  res.status(200).send( '{"erro":"sem id"}');
}
  
});
route.get("/userride/ride", async (_req: Request, res: Response) => {
  var rideId = _req.body as userRide
  if((_req.query['_id']) != undefined){
 res.status(200).send( await findRideByRide(_req.query['_id'] as string,rideId));
}else{
  res.status(200).send( '{"erro":"sem id"}');
}
  
});

route.post("/userride", async (_req: Request, res: Response) => {
  var userRide = _req.body as userRide
  res.status(200).send( await saveUserRide(userRide));
   
 });
 route.put("/userride", async (_req: Request, res: Response) => {
  var userRide = _req.body as userRide
  res.status(200).send( await updateUserRide(userRide));
   
 });
 route.delete("/userride", async (_req: Request, res: Response) => {
  var userRide = _req.body as userRide
  res.status(200).send( await deleteUserRide(userRide));
   
 });

//@@@

//LikedRide @@@
route.get("/like/user", async (_req: Request, res: Response) => {
  var userId = _req.body as LikedRide
  console.log();
  if((_req.query['_id']) != undefined){
 res.status(200).send( await findLikeByUser(_req.query['_id'] as string,userId));
}else{
  res.status(200).send( '{"erro":"sem id"}');
}
  
});
route.get("/like/ride", async (_req: Request, res: Response) => {
  var rideId = _req.body as LikedRide
  if((_req.query['_id']) != undefined){
 res.status(200).send( await findLikeByRide(_req.query['_id'] as string,rideId));
}else{
  res.status(200).send( '{"erro":"sem id"}');
}
  
});

route.post("/like", async (_req: Request, res: Response) => {
  var likedRide = _req.body as LikedRide 
  res.status(200).send( await saveLike(likedRide));
   
 });
 route.put("/like", async (_req: Request, res: Response) => {
  var likedRide = _req.body as LikedRide
  res.status(200).send( await updateLike(likedRide));
   
 });
 route.delete("/like", async (_req: Request, res: Response) => {
  var likedRide = _req.body as LikedRide
  res.status(200).send( await deleteLike(likedRide));
   
 });

//@@@






