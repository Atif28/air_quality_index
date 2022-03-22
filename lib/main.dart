import 'package:air_quality_index/air_quality_modal.dart';
import 'package:air_quality_index/location_data.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cityTextController = TextEditingController();
  final locationData = LocationData();

   AirQualityModel? airQualityModel;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            if(airQualityModel != null)
            Column(
              children: [
                Text(airQualityModel!.data.city.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),
                ),

                 const SizedBox(height: 10,),
                Text('Dominentpol ' + airQualityModel!.data.dominentpol,
                style: const TextStyle(fontSize: 15,
                fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 10,),
                Text('Time ' + airQualityModel!.data.time.s,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),

                const SizedBox(height: 10,),
                Text('Aqi ' + airQualityModel!.data.aqi.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                ),
                
              ],
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: SizedBox(width: 150,
            child: TextField(
              controller: cityTextController,
              decoration:  const InputDecoration(label: Text('City')),
              textAlign: TextAlign.center,
            ),
            ),
            ),
            ElevatedButton(onPressed: search, child: const Text('Search')),
          ],
        ),
      ),
    ),
    );
  }

  void search() async{
    final _airQualityModel = await locationData.getData(cityTextController.text);
    setState(() {
      airQualityModel = _airQualityModel;
    });
  }

}
