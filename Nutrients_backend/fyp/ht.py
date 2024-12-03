import httpx
import asyncio
import json
import sys
from ultralytics import YOLO

def predict_food(image_path):
    model = YOLO('best.pt')

    results = model.predict(image_path)


    result = results[0]

    # Create a set to keep track of printed classes
    printed_classes = set()

    predictions = []

    for box in result.boxes:
        label = result.names[box.cls[0].item()]

        # Check if the class has been printed before
        if label not in printed_classes:
            # Add the class to the set to mark it as printed
            printed_classes.add(label)

            # Add the label to the predictions list
            predictions.append(label)

    return predictions

async def main():
    image_path = sys.argv[1]
    url = 'http://localhost:4001/predict'
    
    predictions = predict_food(image_path)
    json_predictions = json.dumps(predictions)

    async with httpx.AsyncClient() as Client:
        url = "http://localhost:4001/predict"
        headers = {'Content-Type': 'application/json'}
        response = await Client.post(url,data=json_predictions,headers=headers)
        print(response)
        if response.status_code == 200:
            print("Predictions sent successfully!")
        else:
            print(f"Error sending predictions. Status code: {response.status_code}")


asyncio.run(main())

# if __name__ == "__main__":
#     image_path = sys.argv[1]

#     try:
#         predictions = predict_food(image_path)
#         json_predictions = json.dumps(predictions)

        
#         url = "http://localhost:4001/predict"
#         headers = {'Content-Type': 'application/json'}
#         response = requests.post(url,data=json_predictions,headers=headers)
#         print(response)
#         if response.status_code == 200:
#             print("Predictions sent successfully!")
#         else:
#             print(f"Error sending predictions. Status code: {response.status_code}")
            
#     except Exception as e:
#         print(f"Error: {str(e)}")

