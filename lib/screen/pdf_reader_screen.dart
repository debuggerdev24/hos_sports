import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfReaderScreen extends StatefulWidget {
  final String path;
  final String name;
  const PdfReaderScreen({super.key, required this.path, required this.name});

  @override
  State<PdfReaderScreen> createState() => _PdfReaderScreenState();
}

class _PdfReaderScreenState extends State<PdfReaderScreen> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  String? _filePath;
  bool _isReady = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadPdfFromAssets(widget.path, widget.name);
  }

  Future<void> _loadPdfFromAssets(String path, String name) async {
    try {
      final ByteData data = await rootBundle.load(path);
      final Directory tempDir = await getTemporaryDirectory();
      final File tempFile = File('${tempDir.path}/$name');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      setState(() {
        _filePath = tempFile.path;
        _isReady = true;
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isReady
          ? PDFView(
              filePath: _filePath,
              fitEachPage: true,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              onRender: (_pages) {},
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              fitPolicy: FitPolicy.WIDTH,
            )
          : Center(
              child: _errorMessage == null
                  ? const CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red)
                  : Text(_errorMessage!),
            ),
    );
  }
}
