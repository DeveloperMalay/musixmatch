import 'package:musicviewr/model/music_list_model.dart';
import 'package:musicviewr/networking/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();
  Future<MusicList> fetchMusicList() {
    return _provider.getMusicList();
  }
}

class NetworkError extends Error {}
