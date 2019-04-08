part of darksky_weather_query;

class DarkSkyWeatherQuery{
  DarkSkyWeather _darkSkyWeather;

  DarkSkyWeatherQuery(String apiToken,
      {
        Language language = Language.English,
        Units units = Units.US
      }
  ){
    _darkSkyWeather = new DarkSkyWeather(apiToken, language: language, units: units);
  }

  Future<List<QueryAddressResult>> queryAddressWeather(String query) async{
    List<Address> addresses = await Geocoder.local.findAddressesFromQuery(query);
    List<QueryAddressResult> results = new List<QueryAddressResult>();
    for (Address address in addresses) {
      results.add(QueryAddressResult(address, _currentWeather, _timeMachineWeather));
    }
    return results;
  }

  Future<Forecast> _currentWeather(double lat, double long){
    return _darkSkyWeather.getForecast(lat, long);
  }

  Future<Forecast> _timeMachineWeather(double lat, double long, DateTime time){
    return _darkSkyWeather.getTimeMachineForecast(lat, long, time);
  }
}