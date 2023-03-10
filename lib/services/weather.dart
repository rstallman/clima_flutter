import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '*********************';
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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
