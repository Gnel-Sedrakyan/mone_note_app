import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mone_note_app/application/notes_store.dart';
import 'package:mone_note_app/injection.dart';
import 'package:mone_note_app/presentation/core/widgets/app_icon_button.dart';
import 'package:mone_note_app/presentation/core/asset_manager.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mone_note_app/presentation/core/widgets/custom_gesture_detector.dart';
import 'package:mone_note_app/presentation/pages/notes/note_view_page.dart';
import 'package:mone_note_app/presentation/pages/notes/search_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  static const location = "/notes/";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    final notesStore = getIt<NotesStore>();

    notesStore.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notesStore = getIt<NotesStore>();
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                l10n.notes,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              AppIconButton(
                  onPressed: () {
                    context.beamToNamed(SearchPage.location);
                  },
                  child: const Icon(
                    Icons.search,
                    size: 24,
                  )),
              const SizedBox(width: 20),
              AppIconButton(
                  onPressed: () {
                    showDialog(
                      //TODO move dialog to helper method
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.designedBy("Narek Manukyan")),
                                  Text(l10n.redesignedBy("Gnel Sedrakyan")),
                                  Text(l10n.illustrations("maybe Google?")),
                                  Text(l10n.icons("Flutter")),
                                  Text(l10n.font("Nunito")),
                                ],
                              ),
                            ),
                            Center(
                              child: Text(l10n.madeWithLove),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.info_outline,
                    size: 24,
                  )),
              const SizedBox(width: 20),
            ],
          ),
          Observer(builder: (context) {
            if (notesStore.isLoading) {
              return Column(
                children: const [
                  CircularProgressIndicator(),
                ],
              );
            }
            if (notesStore.isEmpty) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.clearTable,
                      width: 350,
                      height: 290,
                    ),
                    Text(l10n.createFirstNote),
                  ],
                ),
              );
            }
            if (notesStore.errorText.isNotEmpty) {
              return Expanded(
                child: Center(
                  child: Text(l10n.errorOccured),
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
                //TODO move to seperate widget
                itemCount: notesStore.notes.length,
                itemBuilder: (_, index) {
                  final note = notesStore.notes[index];
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
                            color: note.color,
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
