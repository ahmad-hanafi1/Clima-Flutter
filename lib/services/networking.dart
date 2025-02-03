import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String url;
  ApiService(this.url);
  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      // var temp = body['main']['temp'];
      // var condition = body['weather'][0]['id'];
      // var cityName = body['name'];
      // print(temp);
      // print(condition);
      // print(cityName);
      return body;
    } else {
      print('Error: ${response.statusCode} - ${response.reasonPhrase}');
    }
    // print(body);
  }
}
