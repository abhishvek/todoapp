import mongoose from "mongoose";
import express, { Request, Response } from "express";
import { router } from "./routes/routes";
import dotenv from "dotenv";

dotenv.config();
const app = express();
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
mongoose.connect(
  process.env.MONGODB_URL as string,

  {
    useUnifiedTopology: true,
    useNewUrlParser: true,
  },
  () => {
    console.log("DB Connected!!");
  }
);

app.use("/", router);
app.listen(process.env.PORT || 8080, () => {
  console.log("Server is rocking at 8080");
});
