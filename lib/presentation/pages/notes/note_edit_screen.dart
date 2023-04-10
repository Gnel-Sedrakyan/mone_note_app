import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:mone_note_app/application/locale_store.dart';
import 'package:mone_note_app/application/notes_store.dart';
import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/injection.dart';
import 'package:mone_note_app/presentation/core/constants/colors.dart';
import 'package:mone_note_app/presentation/core/widgets/app_icon_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({Key? key, required this.isEdit}) : super(key: key);

  final bool isEdit;
  @override
  State<NoteEditScreen> createState() => NoteEditScreenState();
}

class NoteEditScreenState extends State<NoteEditScreen> {
  final localeStore = getIt<LocaleStore>();
  final notesStore = getIt<NotesStore>();
  final tagController = TextEditingController();

  Widget _buildTagInput() {
    return TextFormField(
      controller: tagController,
      decoration: InputDecoration(
        hintText: 'Add tag',
        suffixIcon: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            final tagText = tagController.text.trim();
            if (tagText.isNotEmpty) {
              notesStore.addTagToSelectedNode(tagText);
              tagController.clear();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        notesStore.addTagToSelectedNode(tagController.text);
      },
      child: const Text('Save'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: notesStore.selectedNote?.title);
    final TextEditingController contentController =
        TextEditingController(text: notesStore.selectedNote?.content);
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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              children: [
                                const Icon(Icons.info),
                                const SizedBox(height: 20),
                                Center(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 200),
                                    child: Text(
                                      l10n.discardQuestion,
                                      maxLines: null,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FilledButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    textColorDarkTheme),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () {
                                          context.beamBack();
                                        },
                                        child: Text(l10n.discard)),
                                    FilledButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    textColorDarkTheme),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(l10n.keep)),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        size: 24,
                      )),
                  const Spacer(),
                  AppIconButton(
                      onPressed: () {
                        localeStore.switchLocale();
                      },
                      child: const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 24,
                      )),
                  const SizedBox(width: 20),
                  AppIconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              children: [
                                const Icon(Icons.info),
                                const SizedBox(height: 20),
                                Center(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 200),
                                    child: Text(
                                      l10n.saveQuestion,
                                      maxLines: null,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FilledButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    textColorDarkTheme),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () {
                                          context.beamBack();
                                        },
                                        child: Text(l10n.discard)),
                                    FilledButton(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    textColorDarkTheme),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green)),
                                        onPressed: () {
                                          if (widget.isEdit) {
                                            notesStore.updateSelectedNote(
                                              titleController.text,
                                              contentController.text,
                                            );
                                            notesStore.unselectNote();
                                          } else {
                                            notesStore.add(Note.createNow(
                                              title: titleController.text,
                                              content: contentController.text,
                                            ));
                                          }
                                          context.beamToNamed('/');
                                        },
                                        child: Text(l10n.save)),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.save_outlined,
                        size: 24,
                      )),
                ],
              ),
              const SizedBox(height: 30),
              if (widget.isEdit) ...[
                _buildTagInput(),
                _buildSaveButton(),
              ],
              const SizedBox(height: 30),
              TextField(
                style: const TextStyle(fontSize: 48),
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 48),
                ),
                maxLines: null,
                // onChanged: (value) {
                //   title = value;
                // },
                controller: titleController,
              ),
              TextField(
                style: const TextStyle(fontSize: 23),
                decoration: const InputDecoration(
                  hintText: 'Type something....',
                  hintStyle: TextStyle(fontSize: 23),
                ),
                maxLines: null,
                // onChanged: (value) {
                //   content = value;
                // },
                controller: contentController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
