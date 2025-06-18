const express = require("express");
const app = express();
const cors = require("cors");
const PORT = 5000;

app.use(cors({
    origin: "http://127.0.0.1:56442", // Allow requests from this origin
    methods: ["GET", "POST"], // Allow these HTTP methods
}));

app.get("/", (req, res) => {
    res.send("Hello, World!");
});

app.get("/data", (req, res) => {
    res.json({ message: "This is some data." });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});