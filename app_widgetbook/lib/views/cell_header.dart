import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/ui/cell_header.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CellHeader)
Widget buildCoolButtonUseCase(BuildContext context) {
  return CellHeader(
    header: "Some input",
  );
}
