import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';


class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var weitherData = await networkHelper.getData();

    return weitherData;
  }

  Future<dynamic> getLocationWeither() async {
    Location location = Location();
    await location.getCurrentLocation();
    
    NetworkHelper networkHelper = NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
  
    var weitherData = await networkHelper.getData();

    return weitherData;
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
