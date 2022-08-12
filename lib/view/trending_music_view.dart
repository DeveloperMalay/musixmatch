import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicviewr/bloc/music_bloc.dart';
import 'package:musicviewr/bloc/music_event.dart';
import 'package:musicviewr/bloc/music_state.dart';
import 'package:musicviewr/model/music_list_model.dart';

class TrendingMusicView extends StatefulWidget {
  const TrendingMusicView({Key? key}) : super(key: key);

  @override
  State<TrendingMusicView> createState() => _TrendingMusicViewState();
}

class _TrendingMusicViewState extends State<TrendingMusicView> {
  final MusicBloc _newBloc = MusicBloc();

  @override
  void initState() {
    _newBloc.add(GetMusicList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Songs'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: BlocProvider(
          lazy: false,
          create: (_) => _newBloc,
          child: BlocListener<MusicBloc, MusicState>(
            listener: (context, state) {
              if (state is MusicError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<MusicBloc, MusicState>(
              builder: (context, state) {
                if (state is Musicinitial) {
                  return _buildLoading();
                } else if (state is MusicLoading) {
                  return _buildLoading();
                } else if (state is MusicLoaded) {
                  return _buildCard(context, state.musicList);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCard(BuildContext context, MusicList model) {
  return ListView.builder(
      itemCount: model.message.body.trackList.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                    "Music Name: ${model.message.body.trackList[index].track.trackName}"),
                Text(
                    "Artist Name: ${model.message.body.trackList[index].track.artistName}"),
                Text(
                    "ALbum Name: ${model.message.body.trackList[0].track.albumName}"),
              ],
            ),
          ),
        );
      });
}

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
