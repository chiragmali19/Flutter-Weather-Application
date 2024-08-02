import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String weatherApiKey = 'c9bff3f72dfc5f43529a1bfef972552e';

  static Future<Map<String, dynamic>> getWeather(String destination) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$destination&appid=$weatherApiKey&units=metric');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'temperature': data['main']['temp'],
          'condition': data['weather'][0]['description'],
          'wind_speed': data['wind']['speed'],
          'humidity': data['main']['humidity'],
          'rain': data['rain']?['1h'] ?? 0, // rainfall in the last hour
        };
      } else {
        throw Exception('Failed to load weather data: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<Map<String, dynamic>> getDailyWeather(String destination) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$destination&appid=$weatherApiKey&units=metric');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> list = data['list'];
        return {
          'daily': list.map((entry) {
            return {
              'time': entry['dt_txt'],
              'temperature': entry['main']['temp'],
              'condition': entry['weather'][0]['description'],
              'wind_speed': entry['wind']['speed'],
              'rain': entry['rain']?['3h'] ?? 0, // rainfall in the last 3 hours
            };
          }).toList()
        };
      } else {
        throw Exception('Failed to load daily weather data: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
