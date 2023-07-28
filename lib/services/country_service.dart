import 'package:api_testing/models/country_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Datum>> getAllCountries() async {
  try {
    var response = await http.get(Uri.parse(
        "http://192.168.88.10:30513/otonomus/common/api/v1/countries?page=0&size=300"));
    var decodedResponse = jsonDecode(response.body);
    var result = decodedResponse["data"] as List;
    final finalResponse = result.map((map) => Datum.fromJson(map)).toList();
    return finalResponse;
  } catch (e) {
    print('Error getting countries: $e');
    return [];
  }
}
