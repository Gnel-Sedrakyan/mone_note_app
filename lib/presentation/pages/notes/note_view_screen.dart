import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mone_note_app/application/notes_store.dart';
import 'package:mone_note_app/injection.dart';
import 'package:mone_note_app/presentation/core/widgets/app_icon_button.dart';
import 'package:mone_note_app/presentation/pages/notes/note_edit_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoteViewScreen extends StatefulWidget {
  const NoteViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteViewScreen> createState() => NoteViewScreenState();
}

class NoteViewScreenState extends State<NoteViewScreen> {
  String title = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    final notesStore = getIt<NotesStore>();
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  AppIconButton(
                      onPressed: () {
                        notesStore.unselectNote();
                        context.beamBack();
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        size: 24,
                      )),
                  const Spacer(),
                  AppIconButton(
                      onPressed: () {
                        context.beamToNamed(NoteEditPage.location);
                      },
                      child: const Icon(
                        Icons.edit_outlined,
                        size: 24,
                      )),
                ],
              ),
              const SizedBox(height: 30),
              Observer(
                builder: (_) => Text(
                  notesStore.selectedNote?.title ?? l10n.oops,
                  style: const TextStyle(fontSize: 48),
                  maxLines: null,
                ),
              ),
              Observer(
                builder: (_) => Text(
                  notesStore.selectedNote?.content ?? l10n.somethingWentWrong,
                  style: const TextStyle(fontSize: 23),
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
