import 'package:equatable/equatable.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();
  @override
  List<Object> get props => [];
}

class GetMusicList extends MusicEvent {}
