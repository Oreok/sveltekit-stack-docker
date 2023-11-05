import express from "express";
import cors from "cors";

const app = express();

app.use(cors());

app.get("/", (req, res) => {
    res.send("Server is successfully running!");
});

app.get("/example", (req, res) => {
    res.json({msg: "Hello!"});
})

app.listen("4000", () => console.log("Server listening"));


