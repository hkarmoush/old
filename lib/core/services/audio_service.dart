import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> play(String url) async {
    await _audioPlayer.setUrl(url);
    await _audioPlayer.play();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    await _audioPlayer.play();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  Future<void> forward() async {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition + const Duration(seconds: 5);
    await _audioPlayer.seek(newPosition);
  }

  Future<void> backward() async {
    final currentPosition = _audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 5);
    await _audioPlayer.seek(newPosition);
  }

  Duration? getDuration() {
    return _audioPlayer.duration;
  }

  Future<Duration> getCurrentPosition() async {
    return _audioPlayer.position;
  }

  Stream<Duration?> get onDurationChanged => _audioPlayer.durationStream;

  Stream<Duration> get onPositionChanged => _audioPlayer.positionStream;

  Stream<PlayerState> get onPlayerStateChanged =>
      _audioPlayer.playerStateStream;

  void dispose() {
    _audioPlayer.dispose();
  }
}
