import 'package:flutter/material.dart';
import 'package:mone_note_app/domain/core/entity.dart';
import 'package:mone_note_app/domain/core/value_objects.dart';
import 'package:mone_note_app/domain/notes/value_objects.dart';

class Note implements IEntity {
  @override
  final UniqueId id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Tag> tags;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
  });

  Color get color {
    final hash = id.hashCode;
    return Colors.primaries[hash % Colors.primaries.length];
  }

  Note copyWith({
    UniqueId? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Tag>? tags,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags ?? this.tags,
    );
  }

  static Note createNow({
    required String title,
    required String content,
    List<Tag>? tags,
  }) {
    return Note(
      id: UniqueId(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      tags: tags ?? [],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note && other.id == id;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String toString() => 'Note:$title';
}
