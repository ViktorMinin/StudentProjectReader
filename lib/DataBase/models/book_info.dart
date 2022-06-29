import 'dart:ffi';

import 'package:flutter/material.dart';

const String tableName = "BookInfo";

class BookFields {
  static const String id = "_id";
  static const String bookName = "bookName";
  static const String description = "description";
  static const String author = "author";
  static const String bookPath = "bookPath";
  static const String isLiked = "isLiked";
  static final List<String> values = [
    id,
    bookName,
    description,
    author,
    bookPath,
    isLiked,
  ];
}

class Book {
  final int? id;
  final String bookName;
  final DateTime? description;
  final String? author;
  final String bookPath;
  final int isLiked;
  const Book({
    this.id,
    required this.bookName,
    required this.author,
    required this.description,
    required this.bookPath,
    required this.isLiked,
  });

  Book copy({
    int? id,
    String? bookName,
    DateTime? description,
    String? author,
    String? bookPath,
    int? isLiked,
  }) =>
      Book(
        id: id ?? this.id,
        author: author ?? this.author,
        description: description ?? this.description,
        bookName: bookName ?? this.bookName,
        bookPath: bookPath ?? this.bookPath,
        isLiked: isLiked ?? this.isLiked,
      );

  Map<String, Object?> toJson() => {
        BookFields.id: id,
        BookFields.bookName: bookName,
        BookFields.author: author,
        BookFields.description.toString(): description.toString(),
        BookFields.bookPath: bookPath,
        BookFields.isLiked: isLiked,
      };
  static Book fromJson(Map<String, Object?> json) => Book(
      id: json[BookFields.id] as int?,
      bookName: json[BookFields.bookName] as String,
      author: json[BookFields.author] as String?,
      description: DateTime.parse(json[BookFields.description] as String),
      bookPath: json[BookFields.bookPath] as String,
      isLiked: json[BookFields.isLiked] as int);
}
