import json
import sys
from ultralytics import YOLO
import requests

def predict_food(image_path):
    model = YOLO('best(2).pt')

    results = model.predict(image_path)

    result = results[0]

    # Create a set to keep track of printed classes
    printed_classes = set()

    # Mapping dictionary for label names
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

        # Add more mappings as needed
    }

    predictions = []

    for box in result.boxes:
        label = result.names[box.cls[0].item()]

        # Check if the label is in the mapping dictionary
        if label in label_mapping:
            # Use the mapped label if available
            label = label_mapping[label]

        # Check if the class has been printed before
        if label not in printed_classes:
            # Add the class to the set to mark it as printed
            printed_classes.add(label)

            # Add the label to the predictions list
            predictions.append(label)

    return predictions

if __name__ == "__main__":
    image_path = sys.argv[1]

    try:
        predictions = predict_food(image_path)
        json_predictions = json.dumps(predictions)
        
        url = "http://localhost:4001/predict"
        headers = {'Content-Type': 'application/json'}
        response = requests.post(url, data=json_predictions, headers=headers)
       
        if response.status_code == 200:
            print("Predictions sent successfully!")
        else:
            print(f"Error sending predictions. Status code: {response.status_code}")
            
    except Exception as e:
        print(f"Error: {str(e)}")