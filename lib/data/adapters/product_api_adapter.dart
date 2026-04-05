import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductApiAdapter {
  final _beasUrl = 'https://693e8b3512c964ee6b6dac88.mockapi.io/Products';

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await http.get(Uri.parse(_beasUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load products from Api');
    }
  }
}
