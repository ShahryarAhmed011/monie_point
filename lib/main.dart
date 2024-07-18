import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'infrastructure/di/app_dependency_component.dart';
import 'infrastructure/localization/locales.dart';
import 'infrastructure/routing/app_router.dart';
import 'presentation/modules/global/global_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await createDependencyGraph(prod);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);


  runApp(EasyLocalization(
      supportedLocales: Locales.supportedLocales,
      path: Locales.path,
      fallbackLocale: Locales.fallback,
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppRouter appRouter;
  late final GlobalBloc globalBloc;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    appRouter = GetIt.instance.get();
    globalBloc = GetIt.instance.get();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: globalBloc,
      child: BlocBuilder<GlobalBloc, GlobalState>(
        bloc: globalBloc,
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: state.configuration.themeData,
            routerConfig: appRouter.generateRoutes(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
