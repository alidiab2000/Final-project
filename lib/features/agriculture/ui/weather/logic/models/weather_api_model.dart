class WeatherModel {
  String? date;
  int? avgTemp;
  double? maxTemp;
  double? minTemp;
  String? weatherstate;
  String? icon;
  int? humidity;
  double? windSpeed;
  double? totalPercipitation;
  String? sunrise;
  String? sunset;
  double? feelsLike;
  int? avgTempcomingday1;
  int? avgTempcomingday2; 
  int? avgTempcomingday3;
  int? avgTempcomingday4;
  

  WeatherModel({
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherstate,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.totalPercipitation,
    required this.sunrise,
    required this.sunset,
    required this.feelsLike,
    required this.avgTempcomingday1,
    required this.avgTempcomingday2,
    required this.avgTempcomingday3,
    required this.avgTempcomingday4,
  });
  factory WeatherModel.fromjson(dynamic data) {
    var jsondata = data['forcast']['forcastday'][0]['day'];
    var sundata = data['forcast']['forcastday'][0]['astro'];
    print("temp=${jsondata['avgtemp_c']}");
    return WeatherModel(
      date: data['location']['loacltime'],
      avgTemp: jsondata['avgtemp_c'],
      maxTemp: jsondata['maxtemp_c'],
      minTemp: jsondata['mintemp_c'],
      weatherstate: jsondata['condition']['text'],
      icon: jsondata['condition']['icon'],
      humidity: jsondata['avghumidity'],
      windSpeed: jsondata["maxwind_kph"],
      totalPercipitation: jsondata['totalprecip_mm'],
      sunrise: sundata['sunrise'],
      sunset: sundata['sunset'], 
      feelsLike: data['forcast']['forcastday'][0]['hour']['feelslike_c'],
       avgTempcomingday1: data['forcast']['forcastday'][1]['day']['avgtemp_c'], 
       avgTempcomingday2: data['forcast']['forcastday'][2]['day']['avgtemp_c'], 
       avgTempcomingday3: data['forcast']['forcastday'][3]['day']['avgtemp_c'], 
       avgTempcomingday4: data['forcast']['forcastday'][4]['day']['avgtemp_c'],


    );
  }
}
