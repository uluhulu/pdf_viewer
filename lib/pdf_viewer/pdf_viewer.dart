import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer/pdf_viewer/bloc/pdf_viewer_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatefulWidget {
  final String url;

  const PdfViewerWidget({Key? key, required this.url}) : super(key: key);

  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  late PdfViewerController _controller;
  late PdfViewerBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PdfViewerController();
    _bloc = PdfViewerBloc(_controller.scrollOffset.dy, _controller.zoomLevel);
    _controller.addListener(({property}) {
      _bloc.changeOffset(_controller.scrollOffset.dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Pdf Viewer'),
      ),
      body: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            var upScroll = pointerSignal.scrollDelta.direction > 0;
            _bloc.preventScrolling(_controller);
            _bloc.zoom(_controller, upScroll);
          }
        },
        child: SfPdfViewer.network(
          widget.url,
          interactionMode: PdfInteractionMode.pan,
          controller: _controller,
        ),
      ),
    );
  }
}
