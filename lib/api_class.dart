import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e, s) {
      print('Error: $e'); // Log the error for debugging
      print('Stack Trace: $s'); 
      return 'Error fetching data'; // Or provide a user-friendly error message
    }
  }
}
