import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/domain/notes/note.dart';
import 'package:mone_note_app/domain/notes/value_objects.dart';

class NoteModel {
  final String id;
  final String title;
  final String content;
  final String createdAt;
  final String updatedAt;
  final List<String> tags;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      tags: json['tags'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'tags': tags,
    };
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      title: title,
      content: content,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      tags: List.from(
        tags.map((tag) {
          return Tag(tag);
        }),
      ),
    );
  }

  static NoteModel fromDomain(Note note) {
    return NoteModel(
        id: note.id.getOrCrash(),
        title: note.title,
        content: note.content,
        createdAt: note.createdAt.toIso8601String(),
        updatedAt: note.updatedAt.toIso8601String(),
        tags: List.from(
          note.tags.map((tag) {
            return tag.getOrCrash();
          }),
        ));
  }
}
