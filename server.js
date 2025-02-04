import express from "express";
import cors from "cors";
import records from "./routes/record.js";
import dotenv from "dotenv";
import path from "path";

const __filename = new URL(import.meta.url).pathname;
const __dirname = path.dirname(__filename);
const envPath = path.resolve(__dirname, '../config.env');
dotenv.config({ path: envPath });

const PORT = process.env.PORT || 5050;
const app = express();

app.use(cors());
app.use(express.json());
app.use("/record", records);

// start the Express server
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
