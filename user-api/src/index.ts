import express from "express";
import v1Routes from "./routes/v1";
import v2Routes from "./routes/v2";

const app = express();
const port = 3000;

app.use("/v1", v1Routes);
app.use("/v2", v2Routes);


app.get("/", (req, res) => {
  console.log("[Express] Root route hit");
  res.send("Welcome to User API. Try /v1/users or /v2/users");
});

app.listen(port, () => {
  console.log(`[Express] Server running at http://localhost:${port}`);
});

