import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:mone_note_app/presentation/core/themes/app_theme.dart';
import 'package:mone_note_app/presentation/rotes/core/router.dart';

final GlobalKey mainBeamerKey = GlobalKey();

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BeamerProvider(
      key: mainBeamerKey,
      routerDelegate: CoreRouter.routerDelegate,
      child: MaterialApp.router(
        theme: AppTheme.buildDarkTheme(),
        title: 'Weather',
        debugShowCheckedModeBanner: false,
        //TODO add localisation
        routerDelegate: CoreRouter.routerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: CoreRouter.routerDelegate),
      ),
    );
  }
}
