const express = require("express");
const { exec } = require("child_process");
const mongoose = require("mongoose");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const cors = require("cors");

const app = express();
const port = 8000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

mongoose.connect("mongodb://127.0.0.1/foodss", {});
const db = mongoose.connection;
db.on("error", console.error.bind(console, "MongoDB connection error:"));
db.once("open", () => {
  console.log("Connected to MongoDB");
});

const foodItemSchema = new mongoose.Schema(
  {
    foodId: {
      type: String,
      required: true,
    },
    name: {
      type: String,
      required: true,
    },
    quantity: {
      type: String,
      required: true,
    },
    calories: {
      type: Number,
      required: true,
    },
    proteins: {
      type: Number,
      required: true,
    },
    carbohydrates: {
      type: Number,
      required: true,
    },
    fats: {
      type: Number,
      required: true,
    },
    category: {
      type: String,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);

const imageSchema = new mongoose.Schema({
  image: { data: Buffer, contentType: String },
});

const FoodItem = mongoose.model("fooditems", foodItemSchema);
const Image = mongoose.model("Image", imageSchema);

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, "image.jpg");
  },
});

const upload = multer({ storage: storage });
let predictions = [];

app.post("/predict", (req, res) => {
  predictions = req.body;

  // Check if predictions is empty
  if (predictions.length === 0) {
    console.log("Image is not valid.");
    res.status(400).send("Image is not valid.");
  } else {
    console.log("Received predictions:", predictions);
    res.status(200).send("Predictions received successfully!");
  }
});

app.post("/upload", upload.single("image"), async (req, res) => {
  try {
    if (!req.file) {
      throw new Error("No file uploaded");
    }

    // Execute the Python script
    const pythonScriptPath = "ensemble.py";
    const command = `python ${pythonScriptPath} ${req.file.path}`;

    exec(command, async (error, stdout, stderr) => {
      if (error) {
        console.error(`Error executing Python script: ${error.message}`);
        return res.status(500).send("Internal Server Error");
      }
      console.log(`Python script output:\n${stdout}`);

      //   // Process predictions
      //   const predictions = JSON.parse(stdout); // Assuming the Python script outputs predictions in JSON format

      // Fetch food items based on predictions
      const foodItems = await FoodItem.find({ name: { $in: predictions } });
      console.log(foodItems);

      // Send response with food items
      res.json({
        message: "Image uploaded and processed successfully.",
        fooditems: foodItems,
      });
    });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error uploading file.");
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://192.168.234.25:${port}`);
});
