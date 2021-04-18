import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> getMentalHealthArticles() async {
    String apiKey = '41cd1b7e3d914c648832163efa158946';
    Map<String, dynamic> newsArticles;
    try {
      String url =
          "https://newsapi.org/v2/everything?qInTitle=mental+health&sources=mashable,business-insider,cnn,919thebend.ca&apiKey=$apiKey";
      final uri = Uri.parse(url);
      http.Response r = await http.get(uri);
      newsArticles = jsonDecode(r.body);
    } catch (e) {
      print("error $e");
    }
    return newsArticles;
  }
}
