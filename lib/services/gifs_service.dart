import 'package:flutter/material.dart';
import 'package:gifapp/models/gif_model.dart';
import 'package:http/http.dart' as http;

class GifsService extends ChangeNotifier {

  final String _baseURL = 'https://api.giphy.com/v1/gifs';
  final String _ApiKey = 'NuaGAaMxRf5RqSfs8Yfe8QVhaRAue2DV';
  List<Datum> gif = [];
  List<GifResponse> data = [];
  GifsService(){
    getTreding();
  }

  getTreding() async {
    final url = Uri.parse('$_baseURL/trending?api_key=$_ApiKey&limit=20)');
    final resp = await http.get(url);
    final data = gifResponseFromJson(resp.body);
    gif.addAll(data.data);
    print(gif[0].images);
  }
}