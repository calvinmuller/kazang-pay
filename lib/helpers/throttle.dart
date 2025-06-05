import 'dart:async' show Timer;

class ThrottleFirst {
  bool _enabled = true;

  ThrottleFirst();

  void call(void Function() action) {
    if (_enabled) {
      action();
      _enabled = false;
    }
  }
}

class DebounceAggregator {
  final Duration delay;
  final StringBuffer _buffer = StringBuffer();
  Timer? _timer;

  final void Function(String aggregated) onDebounced;
  final void Function() onFirstCall;

  DebounceAggregator({
    required this.delay,
    required this.onDebounced,
    required this.onFirstCall,
  });

  void call(String? message) {
    if (_buffer.isEmpty) {
      onFirstCall();
    }
    _buffer.write("$message\n");
    _timer?.cancel();
    _timer = Timer(delay, () {
      onDebounced(_buffer.toString());
      _buffer.clear(); // reset after handling
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
