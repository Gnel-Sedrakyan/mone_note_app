// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStoreImpl on NotesStore, Store {
  Computed<List<Note>>? _$filteredNotesComputed;

  @override
  List<Note> get filteredNotes => (_$filteredNotesComputed ??=
          Computed<List<Note>>(() => super.filteredNotes,
              name: 'NotesStore.filteredNotes'))
      .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: 'NotesStore.isEmpty'))
      .value;
  Computed<bool>? _$isShowingSearchResultsComputed;

  @override
  bool get isShowingSearchResults => (_$isShowingSearchResultsComputed ??=
          Computed<bool>(() => super.isShowingSearchResults,
              name: 'NotesStore.isShowingSearchResults'))
      .value;

  late final _$notesAtom = Atom(name: 'NotesStore.notes', context: context);

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$foundNotesAtom =
      Atom(name: 'NotesStore.foundNotes', context: context);

  @override
  ObservableList<Note> get foundNotes {
    _$foundNotesAtom.reportRead();
    return super.foundNotes;
  }

  @override
  set foundNotes(ObservableList<Note> value) {
    _$foundNotesAtom.reportWrite(value, super.foundNotes, () {
      super.foundNotes = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: 'NotesStore.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: 'NotesStore.errorText', context: context);

  @override
  String get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'NotesStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$selectedNoteAtom =
      Atom(name: 'NotesStore.selectedNote', context: context);

  @override
  Note? get selectedNote {
    _$selectedNoteAtom.reportRead();
    return super.selectedNote;
  }

  @override
  set selectedNote(Note? value) {
    _$selectedNoteAtom.reportWrite(value, super.selectedNote, () {
      super.selectedNote = value;
    });
  }

  late final _$getNotesAsyncAction =
      AsyncAction('NotesStore.getNotes', context: context);

  @override
  Future<void> getNotes() {
    return _$getNotesAsyncAction.run(() => super.getNotes());
  }

  late final _$searchNotesAsyncAction =
      AsyncAction('NotesStore.searchNotes', context: context);

  @override
  Future<void> searchNotes() {
    return _$searchNotesAsyncAction.run(() => super.searchNotes());
  }

  late final _$selectNoteAsyncAction =
      AsyncAction('NotesStore.selectNote', context: context);

  @override
  Future<void> selectNote(Note note) {
    return _$selectNoteAsyncAction.run(() => super.selectNote(note));
  }

  late final _$unselectNoteAsyncAction =
      AsyncAction('NotesStore.unselectNote', context: context);

  @override
  Future<void> unselectNote() {
    return _$unselectNoteAsyncAction.run(() => super.unselectNote());
  }

  late final _$addAsyncAction = AsyncAction('NotesStore.add', context: context);

  @override
  Future<void> add(Note note) {
    return _$addAsyncAction.run(() => super.add(note));
  }

  late final _$updateSelectedNoteAsyncAction =
      AsyncAction('NotesStore.updateSelectedNote', context: context);

  @override
  Future<void> updateSelectedNote(String title, String content) {
    return _$updateSelectedNoteAsyncAction
        .run(() => super.updateSelectedNote(title, content));
  }

  late final _$deleteAsyncAction =
      AsyncAction('NotesStore.delete', context: context);

  @override
  Future<void> delete(Note note) {
    return _$deleteAsyncAction.run(() => super.delete(note));
  }

  late final _$NotesStoreActionController =
      ActionController(name: 'NotesStore', context: context);

  @override
  void setSearchText(String text) {
    final _$actionInfo = _$NotesStoreActionController.startAction(
        name: 'NotesStore.setSearchText');
    try {
      return super.setSearchText(text);
    } finally {
      _$NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
foundNotes: ${foundNotes},
searchText: ${searchText},
errorText: ${errorText},
isLoading: ${isLoading},
selectedNote: ${selectedNote},
filteredNotes: ${filteredNotes},
isEmpty: ${isEmpty},
isShowingSearchResults: ${isShowingSearchResults}
    ''';
  }
}
