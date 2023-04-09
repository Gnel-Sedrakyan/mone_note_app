import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/pages/notes/note_edit_screen.dart';

class NoteCreatePage extends StatelessWidget {
  static const location = "/notes/create/";

  const NoteCreatePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteEditScreen(isEdit: false),
    );
  }
}
