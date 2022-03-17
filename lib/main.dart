import 'package:flutter/material.dart';
import 'package:pdf_viewer/pdf_viewer/pdf_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PdfViewerWidget(url: 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',),
    );
  }
}

