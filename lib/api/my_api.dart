import 'dart:convert';

import 'package:flutter_task/model/my_model.dart';
import 'package:http/http.dart' as http;

Future<List<MyModel>> fetchData() async{
  String url = "https://jobs.github.com/positions.json?location=remote";

  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => MyModel.fromJson(data)).toList();
  } else{
    throw Exception("Failed to load");
  }
}