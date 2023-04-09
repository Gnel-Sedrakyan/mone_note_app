import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mone_note_app/presentation/pages/notes/search_screen.dart';

final homeBeamerKey = GlobalKey<BeamerState>();

class SearchPage extends StatelessWidget {
  static const location = "/notes/search/";
  final _homeScaffoldKey = GlobalKey<ScaffoldState>();
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        key: _homeScaffoldKey,
        body: const SearchScreen(),
      ),
    );
  }
}
