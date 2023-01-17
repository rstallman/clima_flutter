import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '6a8c1e9c16617af7b225970a56f61e81';
const openMapWeatherHost = 'api.openweathermap.org';
const openMapWeatherPath = 'data/2.5/weather';


class WeatherModel {

  Future<dynamic> getLocationWeather() async {

    var location = Location();
    await location.getCurrentLocation();

    Uri url = Uri.https(openMapWeatherHost, openMapWeatherPath, {
      'lat': '${location.latitude}',
      'lon': '${location.longitude}',
      'appid': '$apiKey',
      'units': 'metric'
    });

    return await NetworkHelper(url).getData();
  }


  Future<dynamic> getCityWeather(String cityName) async {
    Uri url = Uri.https(openMapWeatherHost, openMapWeatherPath, {
      'q':  '$cityName',
      'appid': '$apiKey',
      'units': 'metric'
    });

    return await NetworkHelper(url).getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
