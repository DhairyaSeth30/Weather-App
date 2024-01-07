import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData() async{
    final String apiUrl = url;

    try {
      http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // API call successful, you can now parse and use the data from response.body
        String data = response.body;
        
        var decodedData = jsonDecode(data);
        return decodedData;

      } else {
        // Handle error if the API call was not successful
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any network-related exceptions
      print('Error: $error');
    }

  }

}