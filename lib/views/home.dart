import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          // style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.search,
              // size: 35,
              // color: Colors.black,
            ),
          ),
        ],
         // backgroundColor: Color(0xFFF48FB1),
      ),
      body:BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context,state){
          if(state is InitaialWeatherState){
            return NoWeatherBody();
          }else if(state is WeatherLoadedState){
            return InfoWeatherBody(
            weather: state.weathermodel,
            );

          }else{
            return Text("Oops Error Here");
          }

        },
      ),
    );
  }
}
