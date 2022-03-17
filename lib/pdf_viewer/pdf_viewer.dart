import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatefulWidget {
  final String url;

  const PdfViewerWidget({Key? key, required this.url}) : super(key: key);

  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Pdf Viewer'),
        ),
        body: SfPdfViewer.network(
          widget.url,
          interactionMode: PdfInteractionMode.pan,
        ));
  }

}
