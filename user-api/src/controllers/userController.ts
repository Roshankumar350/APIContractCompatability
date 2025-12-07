import { Request, Response } from "express";
import { users } from "../data/users";

export const getUsersV1 = (req: Request, res: Response): void => {
    console.log("[Controller] getUsersV1 called");
    res.json(users);
};

export const getUsersV2 = (req: Request, res: Response): void => {
    console.log("[Controller] getUsersV2 called");
    const fullNames = users.map(u => ({ fullName: `${u.firstName} ${u.lastName}` }));
    res.json(fullNames);
};
