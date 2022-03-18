import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatefulWidget {
  final String url;

  const PdfViewerWidget({Key? key, required this.url}) : super(key: key);

  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  late PdfViewerController _controller;
  late double _dy;
  late double _zoomLevel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PdfViewerController();
    _controller.addListener(({property}) {
      _dy = _controller.scrollOffset.dy;
    });
    _zoomLevel = _controller.zoomLevel;
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
            setState(() {
              ///prevent scrolling
              _controller.jumpTo(
                yOffset: _dy,
              );

              ///zoom file depending on scroll direction
              var upScroll = pointerSignal.scrollDelta.direction > 0;
              if (upScroll) {
                _zoomLevel += 0.25;
              } else {
                if (_zoomLevel > 1) {
                  _zoomLevel -= 0.25;
                }
              }
              _controller.zoomLevel = _zoomLevel;
            });
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
