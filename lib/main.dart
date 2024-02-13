import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/theme/styles.dart';
import 'package:weather_app/views/home.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'cubits/get_weather_cubit/weather_states.dart';

import 'cubits/get_weather_cubit/weather_cubit.dart';

void main() {
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Home(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.yellow;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
      return Colors.blue;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.indigo;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.lightBlue;
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.blue;
    case 'Ice pellets':
      return Colors.blueGrey;
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.deepPurple;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.blue;
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.grey;

    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
