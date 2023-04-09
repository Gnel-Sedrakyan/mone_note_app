// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStore, Store {
  Computed<List<Note>>? _$filteredNotesComputed;

  @override
  List<Note> get filteredNotes => (_$filteredNotesComputed ??=
          Computed<List<Note>>(() => super.filteredNotes,
              name: '_NotesStore.filteredNotes'))
      .value;

  late final _$notesAtom = Atom(name: '_NotesStore.notes', context: context);

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

  late final _$searchTextAtom =
      Atom(name: '_NotesStore.searchText', context: context);

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
      Atom(name: '_NotesStore.errorText', context: context);

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

  late final _$getNotesAsyncAction =
      AsyncAction('_NotesStore.getNotes', context: context);

  @override
  Future<void> getNotes() {
    return _$getNotesAsyncAction.run(() => super.getNotes());
  }

  late final _$addAsyncAction =
      AsyncAction('_NotesStore.add', context: context);

  @override
  Future<void> add(Note note) {
    return _$addAsyncAction.run(() => super.add(note));
  }

  late final _$updateAsyncAction =
      AsyncAction('_NotesStore.update', context: context);

  @override
  Future<void> update(Note note, String title, String content) {
    return _$updateAsyncAction.run(() => super.update(note, title, content));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_NotesStore.delete', context: context);

  @override
  Future<void> delete(Note note) {
    return _$deleteAsyncAction.run(() => super.delete(note));
  }

  late final _$_NotesStoreActionController =
      ActionController(name: '_NotesStore', context: context);

  @override
  void setSearchText(String text) {
    final _$actionInfo = _$_NotesStoreActionController.startAction(
        name: '_NotesStore.setSearchText');
    try {
      return super.setSearchText(text);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
searchText: ${searchText},
errorText: ${errorText},
filteredNotes: ${filteredNotes}
    ''';
  }
}
