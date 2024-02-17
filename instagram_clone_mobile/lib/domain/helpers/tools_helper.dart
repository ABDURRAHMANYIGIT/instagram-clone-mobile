class Toolss {
  static String getFormattedDuration(Duration value) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(value.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(value.inSeconds.remainder(60));
    final String twoDigitHours = twoDigits(value.inHours);

    return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
  }
}
