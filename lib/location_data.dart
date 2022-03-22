import 'dart:convert';

import 'package:air_quality_index/air_quality_modal.dart';
import 'package:http/http.dart' as http;

class LocationData{
  Future<AirQualityModel> getData(String city) async{

    
    String token = '4c161cc78151405d23e02d352f41b10bdf3df790';
    

    

    final uri = Uri.parse('http://api.waqi.info/feed/$city/?token=$token');

    final response = await http.get(uri);
    
    final json = jsonDecode(response.body);
    return AirQualityModel.fromJson(json);
   

  }
}




