import 'dart:convert';
import 'package:musicviewr/model/music_list_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio();
  final url =
      'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';

  Future<MusicList> getMusicList() async {
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      return MusicList.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to load music list');
    }
  }
}
