import 'package:flutter/material.dart';

const sunIcon = Icon(
  Icons.sunny,
  color: Colors.yellow,
  size: 30.0,
);

const cloudIcon = Icon(
  Icons.cloud,
  color: Colors.grey,
  size: 30.0,
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Chełm',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '20°C',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            sunIcon,
          ],
        ),
      ),
    );
  }
}
