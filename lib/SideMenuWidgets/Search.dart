import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../DataBase/connections/book_database.dart';
import '../DataBase/models/book_info.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Search'), backgroundColor: Colors.orange),
      body: ElevatedButton(
        child: const Text("Pick up file"),
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: FileType.custom,
            allowedExtensions: ['pdf'],
          );
          if (result != null) {
            for (var res in result.files) {
              final book = Book(
                  bookName: res.name,
                  description: DateTime.now(),
                  bookPath: res.path!,
                  author: "",
                  isLiked: 0);
              Text(book.bookName);
              await BookInfoDatabase.instance.create(book);
            }
          }
        },
      ),
    );
  }

  void OpenFile(List<PlatformFile> files) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FilePage));
  }
}
