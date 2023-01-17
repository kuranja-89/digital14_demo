import 'package:digital14_demo/core/injector.dart';
import 'package:digital14_demo/core/theme/app_color.dart';
import 'package:digital14_demo/presentation/bloc/digital_bloc_observer.dart';
import 'package:digital14_demo/routes/page_routes.dart';
import 'package:digital14_demo/routes/routemaster_event_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';
import 'package:routemaster/routemaster.dart';

import 'core/util/appConsts.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.kTopColor,
  ));
  Loggy.initLoggy();
  Bloc.observer = DigitalBlocObserver();
  await Injector.init(
    appRunner: () => runApp(const AppWrapper()),
  );
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return App(
      observerList: [
        RouteMasterEventObserver(),
      ],
    );
  }
}

class App extends StatefulWidget {
  /// A list of [NavigatorObserver] that will capture all navigation events.
  ///
  /// Separate observers should be defined for separate purposes, depending
  /// on where the captured data is being sent.
  final List<RoutemasterObserver> observerList;

  const App({
    Key? key,
    this.observerList = const [],
  }) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  late final RoutemasterDelegate routeMaster;

  @override
  void initState() {
    routeMaster = RoutemasterDelegate(
      observers: widget.observerList,
      routesBuilder: (context) {
        return PageRoutes.rootRoute;
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: const ObjectKey('AppState'),
      title: AppConsts.appName,
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: routeMaster,
      builder: (context, child) => MediaQuery(
        // override OS-level font scaling
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
