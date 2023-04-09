import 'package:flutter/material.dart';

import 'package:mone_note_app/presentation/pages/notes/note_view_screen.dart';

class NoteViewPage extends StatelessWidget {
  static const location = "/notes/view/";

  const NoteViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteViewScreen(),
    );
  }
}
