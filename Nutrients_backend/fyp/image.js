//This is used to add more foodNames to DB and add nutrient contents explicitely

const mongoose = require("mongoose");
const express = require("express");
const axios = require("axios");

const app = express();
const port = 8000;

// Connect to MongoDB
mongoose.connect("mongodb://127.0.0.1/foodss", {});

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

// Create the FoodItem model
const FoodItem = mongoose.model("FoodItem", foodItemSchema);

// Array of food items
const foodItems = [
 
  {
    foodId: "0",
    name: "chapathi",
    quantity: "1 piece",
    calories: 104,
    proteins: 3.3,
    carbohydrates: 20.6,
    fats: 1.9,
    category: "main course",
  },
  {
    foodId: "1",
    name: "rasagulla",
    quantity: "1 piece",
    calories: 186,
    proteins: 3.3,
    carbohydrates: 30.1,
    fats: 6.1,
    category: "dessert",
  },
  {
    foodId: "2",
    name: "biriyani",
    quantity: "1 plate",
    calories: 589,
    proteins: 21,
    carbohydrates: 85,
    fats: 20,
    category: "main course",
  },
  {
    foodId: "3",
    name: "uttapam",
    quantity: "1 piece",
    calories: 160,
    proteins: 4,
    carbohydrates: 26,
    fats: 4,
    category: "main course",
  },
  {
    foodId: "4",
    name: "palak paneer",
    quantity: "1 serving",
    calories: 280,
    proteins: 12,
    carbohydrates: 12,
    fats: 20,
    category: "main course",
  },
  {
    foodId: "5",
    name: "poha",
    quantity: "1 serving",
    calories: 250,
    proteins: 10,
    carbohydrates: 45,
    fats: 5,
    category: "breakfast",
  },
  {
    foodId: "6",
    name: "khichdi",
    quantity: "1 serving",
    calories: 300,
    proteins: 10,
    carbohydrates: 50,
    fats: 6,
    category: "main course",
  },
  {
    foodId: "7",
    name: "omlet",
    quantity: "1 piece",
    calories: 155,
    proteins: 13,
    carbohydrates: 2,
    fats: 11,
    category: "breakfast",
  },
  {
    foodId: "8",
    name: "rice",
    quantity: "1 cup",
    calories: 205,
    proteins: 4,
    carbohydrates: 45,
    fats: 0.4,
    category: "main course",
  },
  {
    foodId: "9",
    name: "Daal makhni",
    quantity: "1 serving",
    calories: 260,
    proteins: 13,
    carbohydrates: 34,
    fats: 7,
    category: "main course",
  },
  {
    foodId: "10",
    name: "rajma",
    quantity: "1 serving",
    calories: 215,
    proteins: 10,
    carbohydrates: 30,
    fats: 6,
    category: "main course",
  },
  {
    foodId: "11",
    name: "poori",
    quantity: "1 piece",
    calories: 200,
    proteins: 5,
    carbohydrates: 30,
    fats: 7,
    category: "main course",
  },
  {
    foodId: "12",
    name: "channa masala",
    quantity: "1 serving",
    calories: 270,
    proteins: 12,
    carbohydrates: 35,
    fats: 8,
    category: "main course",
  },
  {
    foodId: "13",
    name: "daal",
    quantity: "1 serving",
    calories: 180,
    proteins: 10,
    carbohydrates: 25,
    fats: 4,
    category: "main course",
  },
  {
    foodId: "14",
    name: "sambar",
    quantity: "1 serving",
    calories: 120,
    proteins: 5,
    carbohydrates: 20,
    fats: 3,
    category: "main course",
  },
  {
    foodId: "15",
    name: "paapad",
    quantity: "1 piece",
    calories: 45,
    proteins: 2,
    carbohydrates: 5,
    fats: 2,
    category: "snack",
  },
  {
    foodId: "16",
    name: "gulab jamun",
    quantity: "1 piece",
    calories: 150,
    proteins: 2,
    carbohydrates: 20,
    fats: 7,
    category: "dessert",
  },
  {
    foodId: "17",
    name: "idli",
    quantity: "1 piece",
    calories: 40,
    proteins: 1,
    carbohydrates: 7,
    fats: 1,
    category: "main course",
  },
  {
    foodId: "18",
    name: "vada",
    quantity: "1 piece",
    calories: 150,
    proteins: 2,
    carbohydrates: 15,
    fats: 8,
    category: "snack",
  },
  {
    foodId: "19",
    name: "dosa",
    quantity: "1 piece",
    calories: 120,
    proteins: 5,
    carbohydrates: 20,
    fats: 3,
    category: "main course",
  },
];

//Save each food item to the database
FoodItem.insertMany(foodItems)
  .then((result) => {
    console.log("Food items saved successfully:", result);
  })
  .catch((error) => {
    console.error("Error saving food items:", error);
  });

//fetching nutritens from database from model predicted name
app.get("/food", async (req, res) => {
  // const foodName = req.params.name;
  //const foodName = "Apple"; // Dummy food name

  try {
    // Find the food item by its name
    // const foodItem = await FoodItem.findOne({ foodName });

    // if (!foodItem) {
    //   return res.status(404).json({ error: "Food not found" });
    // }
    // console.log(foodItem);

    // // Send the response received from the other API back to the client
    // res.json(foodItem);
    const foodNames = ["chapathi", "biriyani"];

    const foodItems = await FoodItem.find({ name: { $in: foodNames } });
    console.log(foodItems);

    res.json({
      message: "File uploaded and saved to database successfully.",
      foodItem: foodItems, // Include the foodItem in the response
    });
    console.log(res.json);
  } catch (error) {
    console.error("Error retrieving food details:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://192.168.199.25:${port}`);
});
