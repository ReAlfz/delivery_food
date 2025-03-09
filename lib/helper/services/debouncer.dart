import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer? timer;

  Debouncer({required this.delay});

  void call(void Function() callback) {
    timer?.cancel();
    timer = Timer(delay, callback);
  }

  void dispose() => timer?.cancel();
}
