import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mone_note_app/application/notes_store.dart';
import 'package:mone_note_app/injection.dart';
import 'package:mone_note_app/presentation/core/constants/colors.dart';
import 'package:mone_note_app/presentation/core/asset_manager.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mone_note_app/presentation/core/widgets/custom_gesture_detector.dart';
import 'package:mone_note_app/presentation/pages/notes/note_view_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final notesStore = getIt<NotesStore>();
    final TextEditingController searchController =
        TextEditingController(text: notesStore.searchText);
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            //TODO move to seperate widget and add constraints
            padding: const EdgeInsets.all(28.0),
            child: Container(
              decoration: BoxDecoration(
                color: surfaceColorDarkTheme,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  notesStore.setSearchText(value);
                },
                decoration: InputDecoration(
                  hintText: 'Hmm too many Notes?',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close_outlined),
                    onPressed: () {
                      context.beamToNamed('/');
                    },
                  ),
                ),
              ),
            ),
          ),
          Observer(builder: (context) {
            if (notesStore.isLoading) {
              return Column(
                children: [
                  const CircularProgressIndicator(),
                ],
              );
            }
            if (notesStore.foundNotes.isEmpty) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.fileNotFound,
                      width: 350,
                      height: 290,
                    ),
                    Text(l10n.fileNotFound),
                  ],
                ),
              );
            }
            if (notesStore.errorText.isNotEmpty) {
              return Expanded(
                child: Center(
                  child: Text(l10n.somethingWentWrong),
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: notesStore.foundNotes.length,
                itemBuilder: (_, index) {
                  final note = notesStore.foundNotes[index];
                  //TODO move to Seperate Widget
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Dismissible(
                        key: Key(note.id.getOrCrash()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.red,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: CustomGestureDetector(
                          onPressed: () {
                            notesStore.selectNote(note);
                            context.beamToNamed(NoteViewPage.location);
                          },
                          child: Container(
                            width: double.infinity,
                            color: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 45, vertical: 27),
                            child: Text(note.title),
                          ),
                        ),
                        onDismissed: (direction) {
                          notesStore.delete(note);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
