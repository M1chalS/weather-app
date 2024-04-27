class RealtimeWeather {
  final double temp_c;
  final double wind_kph;
  final int humidity;

  const RealtimeWeather({
    required this.temp_c,
    required this.wind_kph,
    required this.humidity,
  });

  factory RealtimeWeather.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'temp_c': double temp_c,
      'wind_kph': double wind_kph,
      'humidity': int humidity,
      } =>
          RealtimeWeather(
            temp_c: temp_c,
            wind_kph: wind_kph,
            humidity: humidity,
          ),
      _ => throw const FormatException('Failed to load weather.'),
    };
  }
}