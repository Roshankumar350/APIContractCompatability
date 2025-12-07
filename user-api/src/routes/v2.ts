import { Router } from "express";
import { getUsersV2 } from "../controllers/userController";

const router = Router();

router.get("/users", (req, res, next) => {
  console.log("[Router v2] /users route hit");
  next();
}, getUsersV2);

export default router;
