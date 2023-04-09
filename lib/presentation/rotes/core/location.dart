import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/pages/notes/main_page.dart';
import 'package:mone_note_app/presentation/pages/notes/note_create_page.dart';
import 'package:mone_note_app/presentation/pages/notes/note_edit_page.dart';
import 'package:mone_note_app/presentation/pages/notes/note_view_page.dart';
import 'package:mone_note_app/presentation/pages/notes/search_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('home'),
          title: 'home',
          child: MainPage(),
        ),
        if (state.pathPatternSegments.contains('edit'))
          const BeamPage(
            key: ValueKey('edit'),
            title: 'edit',
            child: NoteEditPage(),
          ),
        if (state.pathPatternSegments.contains('create'))
          const BeamPage(
            key: ValueKey('create'),
            title: 'create',
            child: NoteCreatePage(),
          ),
        if (state.pathPatternSegments.contains('view'))
          const BeamPage(
            key: ValueKey('view'),
            title: 'view',
            child: NoteViewPage(),
          ),
        if (state.pathPatternSegments.contains('search'))
          BeamPage(
            key: const ValueKey('search'),
            title: 'search',
            child: SearchPage(),
          ),
      ];
}
