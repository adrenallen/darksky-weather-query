part of darksky_weather_query;

class QueryAddressResult{
  Address _address;
  Function _currentWeather;
  Function _timeMachineWeather;

  QueryAddressResult(Address this._address, 
    Future<Forecast> _currentWeather(double lat, double long), 
    Future<Forecast> _timeMachineWeather(double lat, double long, DateTime time));

  Future<Forecast> getForecast(){
    return _currentWeather(_address.coordinates.latitude, _address.coordinates.longitude);
  }

  Future<Forecast> getTimeMachineForecast(DateTime time){
    return _timeMachineWeather(_address.coordinates.latitude, _address.coordinates.longitude, time);
  }
}