
import 'dart:convert';
import 'package:http/http.dart' as http;

class dataFetch {
  Future<List<dynamic>> fetchData(String ApiUrl) async {
    final response = await http.get(Uri.parse(ApiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
