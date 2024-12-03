// const express = require("express");
// const multer = require("multer");
// const fs = require("fs");
// const mongoose = require("mongoose");
// const path = require("path");

// const app = express();
// const port = 4001;
// const { exec } = require("child_process");
// const cors = require("cors");

// // Connect to MongoDB
// mongoose.connect("mongodb://127.0.0.1/foodss", {
//   useNewUrlParser: true,
//   useUnifiedTopology: true,
// });
// const db = mongoose.connection;
// db.on("error", console.error.bind(console, "MongoDB connection error:"));
// db.once("open", () => {
//   console.log("Connected to MongoDB");
// });

// // FoodItem Schema
// const foodItemSchema = new mongoose.Schema(
//   {
//     foodId: {
//       type: String,
//       required: true,
//     },
//     name: {
//       type: String,
//       required: true,
//     },
//     quantity: {
//       type: String,
//       required: true,
//     },
//     calories: {
//       type: Number,
//       required: true,
//     },
//     proteins: {
//       type: Number,
//       required: true,
//     },

//     carbohydrates: {
//       type: Number,
//       required: true,
//     },
//     fats: {
//       type: Number,
//       required: true,
//     },
//     category: {
//       type: String,
//       required: true,
//     },
//   },
//   {
//     timestamps: true,
//   }
// );

// // Define Mongoose schema
// const imageSchema = new mongoose.Schema({
//   image: { data: Buffer, contentType: String },
// });

// const FoodItem = mongoose.model("FoodItem", foodItemSchema);
// const Image = mongoose.model("Image", imageSchema);

// // Define storage for uploaded files
// const storage = multer.diskStorage({
//   destination: function (req, file, cb) {
//     cb(null, "uploads/");
//   },
//   filename: function (req, file, cb) {
//     cb(null, "image.jpg");
//   },
// });

// // Create multer instance
// const upload = multer({ storage: storage });
// const pythonScriptPath = "ensemble.py";

// // Define route to handle file upload
// // Define route to handle file upload
// // Define route to handle file upload
// app.post("/upload", upload.single("image"), async (req, res) => {
//   try {
//     if (!req.file) {
//       throw new Error("No file uploaded");
//     }

//     // Read the uploaded image
//     const img = fs.readFileSync(req.file.path);

//     // Encode the image data as a base64 string
//     const encodedImg = img.toString("base64");

//     // Create a new document to store the image
//     const newImage = new Image({
//       image: {
//         data: Buffer.from(encodedImg, "base64"),
//         contentType: req.file.mimetype,
//       },
//     });

//     // Save the image to the database
//     console.log(req.file.path);
//     await newImage.save();
//     const fileName = path.basename(req.file.path); // Extract the filename from the full path
//     // console.log(fileName);
//     // Execute the Python script after the file is saved
//     const command = `python ${pythonScriptPath} ${"dosa.jpg"}`;
//     // Execute the Python script
//     exec(command, async (error, stdout, stderr) => {
//       if (error) {
//         console.error(`Error executing Python script: ${error.message}`);
//         res.status(500).send("Error processing image.");
//         return;
//       }
//       console.log(stdout);

//       // Log stdout and stderr
//       console.log("Python Script Output:", stdout);
//       console.error("Python Script Errors:", stderr);
//       let predictions;
//       // Process predictions received from Python script
//       try {
//         console.log(stdout);
//         predictions = stdout.split("\n").filter(Boolean); // Assuming predictions are newline-separated
//         console.log(predictions);
//       } catch (parseError) {
//         console.error(
//           "Error parsing Python script output as JSON:",
//           parseError
//         );
//         res.status(500).send("Error processing predictions.");
//         return;
//       }

//       // Find food items in the database based on predictions
//       const foodItems = await FoodItem.find({ foodName: { $in: predictions } });

//       // Send response
//       res.json({
//         message: "Image uploaded and processed successfully.",
//         foodItems: foodItems,
//       });
//     });
//   } catch (err) {
//     console.error(err);
//     res.status(500).send("Error uploading file.");
//   }
// });

// // Start the server
// app.listen(port, () => {
//   console.log(`Server is running on http://192.168.6.25:${port}`);
// });
const express = require("express");
const { exec } = require("child_process");
const mongoose = require("mongoose");
const multer = require("multer");
const fs = require("fs");
const path = require("path");
const cors = require("cors");

const app = express();
const port = 4001;

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
  { timestamps: true }
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

const pythonScriptPath = "ensemble.py";

const upload = multer({ storage: storage });

app.post("/upload", upload.single("image"), async (req, res) => {
  try {
    if (!req.file) {
      throw new Error("No file uploaded");
    }

    // Execute the Python script
    const command = `python ${pythonScriptPath} ${req.file.path}`;
    exec(command, async (error, stdout, stderr) => {
      if (error) {
        console.error(`Error executing Python script: ${error.message}`);
        return res.status(500).send("Internal Server Error");
      }
      console.log(`Python script output:\n${stdout}`);

      // Process predictions
      const predictions = JSON.parse(stdout); // Assuming the Python script outputs predictions in JSON format

      // Fetch food items based on predictions
      const foodItems = await FoodItem.find({ name: { $in: predictions } });

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
  console.log(`Server is running on http://192.168.6.25:${port}`);
});
