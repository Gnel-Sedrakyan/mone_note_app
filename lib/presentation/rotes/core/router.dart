import 'package:mone_note_app/presentation/pages/notes/main_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:mone_note_app/presentation/rotes/core/location.dart';

class CoreRouter {
  static final routerDelegate = BeamerDelegate(
    initialPath: MainScreen.location,
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomeLocation(),
      ],
    ),
  );
}
