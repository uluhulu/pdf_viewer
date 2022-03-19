class PdfViewerState {
  final double dy;
  final double zoomLevel;

  PdfViewerState({
    required this.dy,
    required this.zoomLevel,
  });

  PdfViewerState.initial(this.dy,
      this.zoomLevel,);

  PdfViewerState copyWith({double? dy, double? zoomLevel}) {
    return PdfViewerState(
      dy: dy ?? this.dy,
      zoomLevel: zoomLevel ?? this.zoomLevel,
    );
  }

}
