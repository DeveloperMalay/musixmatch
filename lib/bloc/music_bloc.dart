import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicviewr/bloc/music_event.dart';
import 'package:musicviewr/bloc/music_state.dart';
import 'package:musicviewr/repository/repository.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(Musicinitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetMusicList>((event, emit) async {
      try {
        emit(MusicLoading());
        final mList = await apiRepository.fetchMusicList();
        emit(MusicLoaded(mList));
        if (mList.error != null) {
          emit(MusicError(mList.error));
        }
      } on NetworkError {
        emit(const MusicError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
