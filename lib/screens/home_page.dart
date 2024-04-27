import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/RealtimeWeather.dart';

const waterIcon = Icon(
  Icons.water_drop,
  color: Colors.blue,
  size: 40.0,
);

const windIcon = Icon(
  Icons.air,
  color: Colors.white,
  size: 40.0,
);

const sunnyIcon = Icon(
  Icons.sunny,
  color: Colors.yellow,
  size: 80.0,
);

const cloudyIcon = Icon(
  Icons.cloud,
  color: Colors.grey,
  size: 80.0,
);

const windyIcon = Icon(
  Icons.air,
  color: Colors.grey,
  size: 80.0,
);

const rainyIcon = Icon(
  Icons.cloudy_snowing,
  color: Colors.grey,
  size: 80.0,
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<RealtimeWeather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: FutureBuilder<RealtimeWeather>(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Chełm',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    "${(snapshot.data!.temp_c.toString())} °C",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  sunnyIcon,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      waterIcon,
                      Text(
                        "${(snapshot.data!.humidity.toString())}%",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      windIcon,
                      Text(
                        "${(snapshot.data!.wind_kph.toString())}k/h",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<RealtimeWeather> fetchWeather() async {
  final response = await http
      .get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=bebf92b75bca4ee29b3223650242704&q=51.143124, 23.471199&aqi=no'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    return RealtimeWeather.fromJson(data['current']);
  } else {
    throw Exception('Failed to load weather.');
  }
}
