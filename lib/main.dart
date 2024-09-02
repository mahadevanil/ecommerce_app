import 'package:flutter/material.dart';
import 'package:auto_injector/auto_injector.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'DI/injector.dart';
import 'constants/interceptor.dart';
import 'providers/bloc_providers.dart';
import 'routes/routes.dart';

final autoInjector = AutoInjector();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioBaseService.init(); //initialize Dio service
  //!---(initializing auto injector )
  autoInjectInitializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviderList,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
