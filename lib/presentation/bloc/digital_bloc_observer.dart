import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

class DigitalBlocObserver extends BlocObserver with UiLoggy {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    /// Capture desired user events that are emitted throughout any bloc
    loggy.info(change.nextState);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    /// Capture desired user events that are emitted throughout any bloc
    loggy.info(event.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    loggy.error(error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    /// Capture bloc seed states.
    loggy.info(bloc.toString());
  }
}
