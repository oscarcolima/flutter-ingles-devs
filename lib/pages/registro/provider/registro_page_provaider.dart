import 'package:flutter/material.dart';

class RegistroPageProvaider with ChangeNotifier {
  final ScrollController controller = ScrollController();
  final GlobalKey keyResitroForm = GlobalKey();

  void gotToForm() {
    final RenderBox? renderBox =
        keyResitroForm.currentContext?.findRenderObject() as RenderBox?;
    final position = renderBox?.localToGlobal(Offset.zero);
    if (position != null) {
      controller.animateTo(
        position.dy,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void init() async {
    notifyListeners();
  }
}
