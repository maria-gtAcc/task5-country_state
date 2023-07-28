import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/state_model.dart';

getStateByCountryId(String countryId) async {
  try {
    var response = await http.get(Uri.parse(
        "http://192.168.88.10:30513/otonomus/common/api/v1/country/${countryId}/states"));
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw decodedResponse["message"];
    }
    var result = decodedResponse["data"] as List;
    final finalResponse = result.map((map) => Datum.fromJson(map)).toList();
    return finalResponse.map((state) => state.stateName).toList();
  } catch (e) {
    print('Error getting states : $e');
    return [];
  }
}
