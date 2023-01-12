import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { redEvent, greenEvent }

class ColorBloc {
  Color _color = Colors.red;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    switch (event) {
      case ColorEvent.greenEvent:
        _color = Colors.green;
        break;

      case ColorEvent.redEvent:
        _color = Colors.red;
        break;

      default:
        throw Exception('Wrong event type');
    }

    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
