// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  String? date;
  int? currentTemp;
  double? avgTemp;
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
  double? avgTempcomingday1;
  double? avgTempcomingday2;
  double? avgTempcomingday3;
  double? avgTempcomingday4;
  int? rainFall;
  WeatherModel({
    required this.date,
    required this.currentTemp,
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
    this.avgTempcomingday4,
    required this.rainFall,
  });

  WeatherModel.empty()
    : date = '',
      currentTemp = 0,
      avgTemp = 0.0,
      maxTemp = 0.0,
      minTemp = 0.0,
      weatherstate = '',
      icon = '',
      humidity = 0,
      windSpeed = 0.0,
      totalPercipitation = 0.0,
      sunrise = '',
      sunset = '',
      feelsLike = 0.0,
      rainFall = 0,
      avgTempcomingday1 = 0.0,
      avgTempcomingday2 = 0.0,
      avgTempcomingday3 = 0.0;
  factory WeatherModel.fromjson(dynamic data) {
    List<dynamic> forecastDays = data['forecast']['forecastday'] ?? [];

    Map<String, dynamic> jsondata =
        forecastDays.isNotEmpty ? forecastDays[0]['day'] : {};
    var sundata = forecastDays.isNotEmpty ? forecastDays[0]['astro'] : {};
    var hourData = forecastDays.isNotEmpty ? forecastDays[0]['hour'] : [];

    int currentHour = DateTime.now().hour;
    double safeFeelsLike =
        (currentHour >= 0 && currentHour < hourData.length)
            ? hourData[currentHour]['feelslike_c']?.toDouble() ?? 0.0
            : 0.0;

    double? getAvgTempForDay(int index) {
      if (forecastDays.length > index) {
        return forecastDays[index]['day']['avgtemp_c']?.toDouble();
      } else {
        return 0.0;
      }
    }

    return WeatherModel(
      rainFall: jsondata["daily_will_it_rain"],
      currentTemp: data['current']['temp_c']?.toInt() ?? 0,
      date: data['location']['localtime'] ?? '',
      avgTemp: jsondata['avgtemp_c']?.toDouble() ?? 0.0,
      maxTemp: jsondata['maxtemp_c']?.toDouble() ?? 0.0,
      minTemp: jsondata['mintemp_c']?.toDouble() ?? 0.0,
      weatherstate: jsondata['condition']?['text'] ?? '',
      icon: jsondata['condition']?['icon'] ?? '',
      humidity: jsondata['avghumidity']?.toInt() ?? 0,
      windSpeed: jsondata["maxwind_kph"]?.toDouble() ?? 0.0,
      totalPercipitation: jsondata['totalprecip_mm']?.toDouble() ?? 0.0,
      sunrise: sundata['sunrise'] ?? '',
      sunset: sundata['sunset'] ?? '',
      feelsLike: safeFeelsLike,
      avgTempcomingday1: getAvgTempForDay(0),
      avgTempcomingday2: getAvgTempForDay(1),
      avgTempcomingday3: getAvgTempForDay(2),
    );
  }
}
