import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_viewer/pdf_viewer/bloc/pdf_viewer_state.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerBloc extends Cubit<PdfViewerState> {
  PdfViewerBloc(double _dy, double _zoomLevel)
      : super(PdfViewerState(
          dy: _dy,
          zoomLevel: _zoomLevel,
        ));

  Future changeOffset(double dy) async {
    emit(state.copyWith(dy: dy));
  }

  void preventScrolling(PdfViewerController controller) {
    controller.jumpTo(
      yOffset: state.dy,
    );
  }

  void zoom(PdfViewerController controller, bool upScroll) {
    var _zoomLevel = state.zoomLevel;
    if (upScroll) {
      _zoomLevel += 0.25;
    } else {
      if (_zoomLevel > 1) {
        _zoomLevel -= 0.25;
      }
    }
    controller.zoomLevel = _zoomLevel;
    emit(state.copyWith(zoomLevel: _zoomLevel));
  }
}
