import os
from flask import Flask, request, jsonify, abort
from flask_cors import CORS
import pickle
import pandas as pd

# Configuration
MODEL_PATH = os.path.join(os.getcwd(), 'crop_water_usage_model.pkl')
CROP_MAPPING = {'rice': 0, 'maize': 1, 'banana': 2, 'watermelon': 3, 'cotton': 4}

app = Flask(__name__)
CORS(app)

# Load model
try:
    with open(MODEL_PATH, 'rb') as f:
        model = pickle.load(f)
except Exception as e:
    print(f"Error loading model: {e}")
    raise

@app.route('/')
def index():
    return "Crop Water Usage API"

@app.route('/api/recommendation', methods=['POST'])
def recommendation():
    data: dict = request.get_json()
    print("Received data:", data)
    crop = data.get('crop')
    weather_data: list[dict] = data.get('weekly_weather_data')
    area = data.get('area')  # Area in square meters

    if not all([crop, weather_data, area]) or not isinstance(weather_data, list):
        abort(400, description='Invalid input data')
    if crop not in CROP_MAPPING:
        abort(400, description='Invalid crop type')
    if not isinstance(area, (int, float)) or area <= 0:
        abort(400, description='Area must be a positive number')

    recommendations = []
    for week in weather_data:
        required_fields = ['date', 'N', 'P', 'K', 'temperature', 'humidity', 'ph', 'rainfall(mm)']
        if not all(week.get(field) is not None for field in required_fields):
            continue

        try:
            input_data = pd.DataFrame([[
                week['N'], week['P'], week['K'], week['temperature'],
                week['humidity'], week['ph'], week['rainfall(mm)']
            ]], columns=['N', 'P', 'K', 'temperature', 'humidity', 'ph', 'rainfall(mm)'])

            water_usage_per_sqm = model.predict(input_data)[0]
            total_water_usage = water_usage_per_sqm * area
            recommendations.append({
                'date': week['date'],
                'cropName':crop,
                'temperature': week['temperature'],
                'area': area,
                'water_usage_per_sqm': f'{water_usage_per_sqm:.2f} liters',
                'total_water_usage': f'{total_water_usage:.2f} liters'
            })
        except Exception as e:
            print(f"Error processing week data: {e}")
            continue

    return jsonify({'recommendations': recommendations})

if __name__ == '__main__':
    app.run( debug=True, host='0.0.0.0' , port=8000)
