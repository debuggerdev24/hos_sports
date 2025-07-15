import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';

class PDFScreen extends StatefulWidget {
  final String url;
  const PDFScreen({super.key, required this.url});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

// String url = 'assets/pdf/privacy.pdf';

class _PDFScreenState extends State<PDFScreen> {
  late PdfControllerPinch _pdfController;
  int _currentPage = 1;
  int _totalPages = 0;

  Future loadPdf() async {
    try {
      await rootBundle.load(widget.url);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset(widget.url),
      initialPage: _currentPage,
    );

    _pdfController.document.then((document) {
      setState(() {
        _totalPages = document.pagesCount;
      });
    });

    loadPdf();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget loaderWidget = const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );

    return Scaffold(
      appBar: AppBar(actions: [
        Text(
          'Page $_currentPage / $_totalPages     ',
          style: TextStyle(color: Colors.white),
        ),
      ]),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: MediaQuery.of(context).size.height,
          child: _totalPages == 0
              ? loaderWidget
              : PdfViewPinch(
                  backgroundDecoration:
                      BoxDecoration(color: Colors.grey.shade100),
                  controller: _pdfController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                ),
        ),
      ),
    );
  }
}
