import 'package:flutter/material.dart';

const String tableName = "BookInfo";

class BookFields {
  static const String id = "_id";
  static const String bookName = "bookName";
  static const String description = "description";
  static const String author = "author";
  static const String bookPath = "bookPath";

  static final List<String> values = [
    id,
    bookName,
    description,
    author,
    bookPath
  ];
}

class Book {
  final int? id;
  final String bookName;
  final String? description;
  final String? author;
  final String bookPath;
  const Book(
      {this.id,
      required this.bookName,
      required this.author,
      required this.description,
      required this.bookPath});

  Book copy({
    int? id,
    String? bookName,
    String? description,
    String? author,
    String? bookPath,
  }) =>
      Book(
          id: id ?? this.id,
          author: author ?? this.author,
          description: description ?? this.description,
          bookName: bookName ?? this.bookName,
          bookPath: bookPath ?? this.bookPath);

  Map<String, Object?> toJson() => {
        BookFields.id: id,
        BookFields.bookName: bookName,
        BookFields.author: author,
        BookFields.description: description,
        BookFields.bookPath: bookPath,
      };
  static Book fromJson(Map<String, Object?> json) => Book(
      id: json[BookFields.id] as int?,
      bookName: json[BookFields.bookName] as String,
      author: json[BookFields.author] as String?,
      description: json[BookFields.description] as String?,
      bookPath: json[BookFields.bookPath] as String);
}
