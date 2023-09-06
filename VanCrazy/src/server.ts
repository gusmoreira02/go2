import express from "express";
import { route } from "./routes/route";

const port = 3000
const app  = express();

app.use(express.json({limit:"50mb"}));
app.use(route);



app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})