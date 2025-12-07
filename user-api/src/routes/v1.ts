import { Router } from "express";
import { getUsersV1 } from "../controllers/userController";

const router = Router();

router.get("/users", (req, res, next) => {
  console.log("[Router v1] /users route hit");
  next();
}, getUsersV1);


export default router;
