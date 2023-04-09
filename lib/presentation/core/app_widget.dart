import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mone_note_app/application/locale_store.dart';
import 'package:mone_note_app/injection.dart';
import 'package:mone_note_app/presentation/core/themes/app_theme.dart';
import 'package:mone_note_app/presentation/rotes/core/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey mainBeamerKey = GlobalKey();

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeStore = getIt<LocaleStore>();
    return Observer(
      builder: (_) => BeamerProvider(
        key: mainBeamerKey,
        routerDelegate: CoreRouter.routerDelegate,
        child: MaterialApp.router(
          theme: AppTheme.buildDarkTheme(),

          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localeStore.currentLocale,
          title: 'Notes',
          debugShowCheckedModeBanner: false,
          //TODO add localisation
          routerDelegate: CoreRouter.routerDelegate,
          routeInformationParser: BeamerParser(),
          backButtonDispatcher:
              BeamerBackButtonDispatcher(delegate: CoreRouter.routerDelegate),
        ),
      ),
    );
  }
}
