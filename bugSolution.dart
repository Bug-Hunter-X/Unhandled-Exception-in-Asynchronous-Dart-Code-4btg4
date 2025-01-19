```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw HttpException('HTTP request failed', response.statusCode, response.body);
    }
  } on SocketException catch (e) {
    print('Network error: $e');
    return null;
  } on FormatException catch (e) {
    print('JSON decoding error: $e');
    return null;
  } on HttpException catch (e) {
    print('HTTP error: ${e.message}, status code: ${e.statusCode}, response body: ${e.responseBody}');
    return null; 
  } catch (e) {
    print('Unexpected error: $e');
    rethrow; 
  }
}

class HttpException implements Exception {
  final String message;
  final int statusCode;
  final String? responseBody;

  HttpException(this.message, this.statusCode, this.responseBody);
}
```