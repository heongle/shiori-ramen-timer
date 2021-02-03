import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class SoundPlayer {
  final String _prefix = "assets/audio/";
  final List<String> _ckList = ['ck1.mp3', 'ck2.mp3', 'ck3.mp3', 'ck4.mp3'];
  final List<String> _tkList = ['tk1.mp3', 'tk2.mp3', 'tk3.mp3', 'tk4.mp3'];
  final AudioPlayer _ckPlayer = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  final AudioPlayer _tkPlayer = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  final AudioPlayer _completePlayer = new AudioPlayer();
  AudioCache _ckCache;
  AudioCache _tkCache;
  AudioCache _completeCache;
  SoundPlayer() {
    _ckCache = AudioCache(prefix: _prefix, fixedPlayer: _ckPlayer);
    _tkCache = AudioCache(prefix: _prefix, fixedPlayer: _tkPlayer);
    _completeCache = AudioCache(prefix: _prefix, fixedPlayer: _completePlayer);

    _ckCache.loadAll(_ckList);
    _tkCache.loadAll(_tkList);
    _completeCache.load('ramendekita.mp3');
  }

  Future<void> playCk(int index) async {
    _ckCache.play(_ckList[index]);
  }

  Future<void> playTk(int index) async {
    _tkCache.play(_tkList[index]);
  }

  Future<void> playCompleted() async {
    _completeCache.play('ramendekita.mp3');
  }
}