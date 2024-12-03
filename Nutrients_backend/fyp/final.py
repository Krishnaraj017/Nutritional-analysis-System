# from ultralytics import YOLO

# # Load a COCO-pretrained YOLOv8n model
# model = YOLO('yolov8n.pt')

# # Display model information (optional)
# model.info()

# # Train the model on the COCO8 example dataset for 100 epochs
# results = model.train(data='coco8.yaml', epochs=100, imgsz=640,)

# # Run inference with the YOLOv8n model on the 'bus.jpg' image
# results = model('dosa.jpg')

import json
import sys
from collections import defaultdict
from ultralytics import YOLO
import requests

def predict_food(image_path, model_paths):
    predictions = defaultdict(float)
    seen_predictions = set()  # Track previously predicted items

    # Label mapping
    label_mapping = {
        '0': 'chapathi',
        '1': 'rasagulla',
        '2': 'biriyani',
        '3': 'uttapam',
        '4': 'palak paneer',
        '5': 'poha',
        '6': 'khichdi',
        '7': 'omlet',
        '8':' rice',
        '9': 'Daal makhni',
        '10': 'rajma',
        '11': 'poori',
        '12': 'channa masala',
        '13': 'daal',
        '14': 'sambar',
        '15' :'paapad',
        '16': 'gulab jamun',
        '17': 'idli',
        '18': 'vada',
        '19': 'dosa'
    }

    # Iterate through each model
    for model_path in model_paths:
        # Load the YOLO model
        model = YOLO(model_path)

        # Predict using the model
        results = model.predict(image_path)
        result = results[0]

        # Aggregate predictions and confidence scores
        for box in result.boxes:
            label_id = box.cls[0].item()
            label = result.names[label_id]
            confidence = float(box.conf.item())

            # Use the mapped label if available
            if label in label_mapping:
                label = label_mapping[label]

            # Filter for unique predictions with high confidence
            if confidence > 0.5 and label not in seen_predictions:  # Adjust confidence threshold as needed
                seen_predictions.add(label)
                predictions[label] = confidence

    return list(predictions.keys())

if __name__ == "__main__":
    image_path = sys.argv[1]

    try:
        # List of model paths
        model_paths = ["bestfinal.pt", "best(2).pt"]  # Add more model paths as needed

        # Predict food using ensemble of models
        predictions = predict_food(image_path, model_paths)
        json_predictions = json.dumps(predictions)

        # POST predictions to the server
        url = "http://localhost:4001/predict"
        headers = {'Content-Type': 'application/json'}
        response = requests.post(url, data=json_predictions, headers=headers)

        if response.status_code == 200:
            print("Predictions sent successfully!")
        else:
            print(f"Error sending predictions. Status code: {response.status_code}")

    except Exception as e:
        print(f"Error: {str(e)}")
