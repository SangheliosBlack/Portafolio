import 'package:flutter/cupertino.dart';

class ScrollAnimService with ChangeNotifier {
  bool _isScroll = false;

  bool get isScroll => this._isScroll;

  set isScroll(bool valor) {
    _isScroll = valor;
    notifyListeners();
  }

  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  PageController _pageController = new PageController();

  PageController get pageController => this._pageController;

  set paginaActual(valor) {
    isScroll = true;
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    Future.delayed(const Duration(milliseconds: 1100), () {
      isScroll = false;
      print('ya');
    });
    notifyListeners();
  }
}
