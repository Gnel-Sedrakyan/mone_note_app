import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/core/constants/styles.dart';
import 'package:mone_note_app/presentation/pages/notes/main_screen.dart';
import 'package:mone_note_app/presentation/pages/notes/note_create_page.dart';

final homeBeamerKey = GlobalKey<BeamerState>();

class MainPage extends StatelessWidget {
  final _homeScaffoldKey = GlobalKey<ScaffoldState>();
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        key: _homeScaffoldKey,
        body: const MainScreen(),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: defaultshadow,
          ),
          child: FloatingActionButton(
            onPressed: () {
              // notesStore.getNotes();
              context.beamToNamed(NoteCreatePage.location);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
