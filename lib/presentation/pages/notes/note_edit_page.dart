import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/pages/notes/note_edit_screen.dart';

final homeBeamerKey = GlobalKey<BeamerState>();

class NoteEditPage extends StatelessWidget {
  static const location = "/notes/edit/";

  const NoteEditPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteEditScreen(isEdit: true),
    );
  }
}
