import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

/// Represents Homepage for Navigation
class HomePage extends StatelessWidget {
  HomePage({required this.path});
  String path;
  @override
  Widget build(BuildContext context) {
    return PdfView(
      controller: PdfController(document: PdfDocument.openFile(path)),
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
    );
    /*
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter PDF Viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                semanticLabel: 'Bookmark',
              ),
              onPressed: () {
                null;
              },
            ),
          ],
        ),
        body: PdfDocument.openFile("/data/user/0/com.example.new_project/cache/file_picker/2_5190544741166482412.pdf") 
        );*/
  }
}
