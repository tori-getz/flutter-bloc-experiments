import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionState {
  final bool connected;

  InternetConnectionState(this.connected);
}

class InternetCubit extends Cubit<InternetConnectionState> {
  late StreamSubscription<ConnectivityResult> _subscription;

  InternetCubit() : super(InternetConnectionState(false)) {
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      emit(InternetConnectionState(event != ConnectivityResult.none));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
