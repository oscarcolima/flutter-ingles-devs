import 'package:excel/excel.dart';

class GenerarExcel {
  final String name;

  GenerarExcel(this.name) {
    excel = Excel.createExcel();
  }

  late Excel excel;

  void crearHoja(String nombre, List<List<CellValue>> rows) {
    Sheet sheetObject = excel[nombre];

    for (var row in rows) {
      sheetObject.appendRow(row);
    }

    // for (var i = 0; i < rows.length; i++) {
    //   final row = rows[i];
    //   sheetObject.insertRowIterables(row, i);
    // }
  }

  void guardar() {
    excel.setDefaultSheet(excel.sheets.keys.elementAt(1));
    excel['Sheet1'].isRTL;
    // excel.delete('Sheet1');

    excel.save(fileName: '$name.xlsx');
  }
}
