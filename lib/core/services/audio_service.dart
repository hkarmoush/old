import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Play audio from a URL
  Future<void> play(String url) async {
    await _audioPlayer.play(UrlSource(url));
  }

  // Pause audio playback
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  // Resume audio playback
  Future<void> resume() async {
    await _audioPlayer.resume();
  }

  // Stop audio playback
  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  // Seek to a specific position
  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Get the current playback position
  Future<Duration?> getCurrentPosition() async {
    return _audioPlayer.getCurrentPosition();
  }

  // Dispose of the audio player when it's no longer needed
  void dispose() {
    _audioPlayer.dispose();
  }
}
