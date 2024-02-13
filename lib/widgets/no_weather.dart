import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget{
  const  NoWeatherBody({Key? key,}):super(key: key);
  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No City Selected")
        ],
      ),
    ),
  );
  }


}