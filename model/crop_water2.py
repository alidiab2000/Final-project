import os
from flask import Flask, request, jsonify
from flask_cors import CORS
import pickle
import pandas as pd

app = Flask(__name__)
CORS(app)


model_path = os.path.join(os.getcwd(), 'crop_water_usage_model.pkl')
with open(model_path, 'rb') as f:
    model = pickle.load(f)


crop_mapping = {
    'rice': 0,
    'maize': 1,
    'banana': 2,
    'watermelon': 3,
    'cotton': 4
}


crop_ranges = {
    'rice': {  
        'N': (50, 150),      
        'P': (20, 60),
        'K': (30, 80),
        'temperature': (20, 35),  
        'humidity': (60, 100),   
        'ph': (5.0, 7.5),         
        'rainfall(mm)': (100, 300)  
    },
    'maize': {  
        'N': (80, 200),
        'P': (30, 70),
        'K': (40, 100),
        'temperature': (15, 35),
        'humidity': (50, 85),
        'ph': (5.5, 7.0),
        'rainfall(mm)': (50, 200)
    },
    'banana': {  
        'N': (100, 250),
        'P': (40, 80),
        'K': (150, 400),
        'temperature': (20, 35),
        'humidity': (60, 90),
        'ph': (5.5, 7.5),
        'rainfall(mm)': (150, 300)
    },
    'watermelon': {  
        'N': (60, 150),
        'P': (30, 70),
        'K': (80, 200),
        'temperature': (22, 38),
        'humidity': (50, 80),
        'ph': (6.0, 7.0),
        'rainfall(mm)': (100, 250)
    },
    'cotton': {  
        'N': (70, 180),
        'P': (25, 60),
        'K': (50, 150),
        'temperature': (18, 40),
        'humidity': (40, 75),
        'ph': (5.5, 8.5),
        'rainfall(mm)': (50, 150)
    }
}

def validate_inputs(crop : str, input_data:dict):
    if crop not in crop_ranges:
        return [f"crop {crop} Not supported"]
    
    errors = []
    for key, value in input_data.items():
        if key in crop_ranges[crop]:
            min_val, max_val = crop_ranges[crop][key]
            if value < min_val or value > max_val:
                errors.append(f"value {key} For the crop {crop} You must be in between {min_val} و {max_val} (Input value: {value})")
    return errors

@app.route('/api/recommendation', methods=['POST'])
def recommendation():

    data:dict = request.get_json()
    

    crop = data.get('crop')
    daily_weather_data = data.get('daily_weather_data')

    if not crop:
        return jsonify({'error': ' Crop type must be specified'}), 400
    if crop not in crop_mapping:
        return jsonify({
            'error': 'Not supported',
            'supported_crops': list(crop_mapping.keys())
        }), 400
    if not daily_weather_data or not isinstance(daily_weather_data, list):
        return jsonify({'error': 'Daily weather data must be entered correctly'}), 400

    recommendations = []
    
    for day_data in daily_weather_data:
    
        required_fields = ['date', 'N', 'P', 'K', 'temperature', 'humidity', 'ph', 'rainfall(mm)']
        missing_fields = [field for field in required_fields if field not in day_data]
        
        if missing_fields:
            return jsonify({
                'error': 'Missing data',
                'missing_fields': missing_fields,
                'date': day_data.get('date')
            }), 400

        validation_errors = validate_inputs(crop, {
            'N': day_data['N'],
            'P': day_data['P'],
            'K': day_data['K'],
            'temperature': day_data['temperature'],
            'humidity': day_data['humidity'],
            'ph': day_data['ph'],
            'rainfall(mm)': day_data['rainfall(mm)']
        })

        if validation_errors:
            return jsonify({
                'error': 'Invalid values',
                'details': validation_errors,
                'date': day_data['date']
            }), 400


        input_df = pd.DataFrame([[
            day_data['N'],
            day_data['P'],
            day_data['K'],
            day_data['temperature'],
            day_data['humidity'],
            day_data['ph'],
            day_data['rainfall(mm)']
        ]], columns=['N', 'P', 'K', 'temperature', 'humidity', 'ph', 'rainfall(mm)'])


        try:
            water_usage = model.predict(input_df)[0]
            recommendations.append({
                'date': day_data['date'],
                'recommended_water': f"{water_usage:.2f} لتر/م²",
                'status': 'success',
                'crop': crop
            })
        except Exception as e:
            recommendations.append({
                'date': day_data['date'],
                'status': 'error',
                'message': f"Failed to calculate recommendation: {str(e)}"
            })

    return jsonify({
        'success': True,
        'recommendations': recommendations,
        'crop': crop
    })

if __name__ == '__main__':
    app.run( debug=True, host='0.0.0.0' , port=8000)