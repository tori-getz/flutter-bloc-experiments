import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/bloc/color_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
    debugShowCheckedModeBanner: false,
  ));
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = ColorBloc();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter BLoC'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return AnimatedContainer(
                width: 100,
                height: 100,
                color: snapshot.data,
                duration: const Duration(milliseconds: 500));
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.greenEvent);
            },
            backgroundColor: Colors.green,
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.redEvent);
            },
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
