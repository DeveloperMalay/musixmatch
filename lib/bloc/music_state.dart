import 'package:equatable/equatable.dart';
import 'package:musicviewr/model/music_list_model.dart';

abstract class MusicState extends Equatable {
  const MusicState();
  @override
  List<Object> get props => [];
}

class Musicinitial extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState {
  final MusicList musicList;

  const MusicLoaded(this.musicList);
}

class MusicError extends MusicState {
  final String? message;
  const MusicError(this.message);
}
