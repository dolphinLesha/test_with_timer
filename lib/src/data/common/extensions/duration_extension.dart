extension DurationX on Duration {
  String get convertToTime {
    int minutes = inMinutes - inHours * 60;
    int seconds = inSeconds - inMinutes * 60;
    return '${inHours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
