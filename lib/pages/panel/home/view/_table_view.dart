/* // ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';

class _TableView extends StatefulWidget {
  final List<RegistroModel>? dataTable;
  const _TableView({
    super.key,
    this.dataTable,
  });

  @override
  State<_TableView> createState() => _TableViewState();
}

class _TableViewState extends State<_TableView> {
  int? odernColum;
  bool ordenAsendente = false;

  @override
  void initState() {
    dataTable = widget.dataTable;
    super.initState();
    final sizeScreen = context.read<ResponsiveApp>().sizeScreen;
  }

  @override
  void didUpdateWidget(covariant _TableView oldWidget) {
    dataTable = widget.dataTable;
    odernColum = null;
    ordenAsendente = false;
    super.didUpdateWidget(oldWidget);
  }

  List<RegistroModel>? dataTable;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);
    final size =
        context.select<ResponsiveApp, double>((ResponsiveApp p) => p.size);
    final tema = Theme.of(context).copyWith(
        cardTheme: const CardTheme(color: Colors.white, elevation: 0));

    return Theme(
      data: tema,
      child: PaginatedDataTable2(
        // minWidth: 500,
        horizontalMargin: 10,
        sortColumnIndex: odernColum,
        sortAscending: ordenAsendente,
        columnSpacing: 5,
        columns: generarColumnas(sizeScreen),
        source: UsuariosTable(
          dataTable: dataTable ?? [],
          sizeScreen: sizeScreen,
        ),
      ),
    );
  }

  List<DataColumn> generarColumnas(SizeScreen sizeScreen) {
    final column = [
      {'titulo': "#", 'orden': 0},
      {'titulo': "nombre completo", 'orden': null},
      {'titulo': "puntaje", 'orden': 1},
      {'titulo': "aciertos", 'orden': 2},
      {'titulo': "nivel", 'orden': 3},
      {'titulo': "acción", 'orden': null},
    ];
    print("size: $sizeScreen");

    List<DataColumn> columns = [];
    for (var i = 0; i < column.length; i++) {
      final col = column[i];
      // generar label de la columna
      final label = Row(
        children: [
          Text(
            col['titulo'] as String,
            style: GoogleFonts.getFont(
              'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (col['orden'] != null && odernColum != i)
            const Icon(
              Icons.filter_alt_rounded,
              size: 15,
            )
        ],
      );

      final titulo = col['titulo'] as String;
      final onSort = (col['orden'] == null) ? null : orderby;
      late DataColumn2 auxcolumn;

      if (["nombre completo"].contains(titulo)) {
        auxcolumn = DataColumn2(onSort: onSort, label: label);
      } else if (["#"].contains(titulo)) {
        auxcolumn = DataColumn2(fixedWidth: 100, onSort: onSort, label: label);
      } else if (['puntaje', 'aciertos'].contains(titulo)) {
        auxcolumn = DataColumn2(fixedWidth: 110, onSort: onSort, label: label);
      } else {
        auxcolumn = DataColumn2(fixedWidth: 100, onSort: onSort, label: label);
      }

      columns.add(auxcolumn);
    }
    return columns;
  }

  ///
  /// Crear Funcion de Ordenacion
  ///
  void orderby(int columnIndex, bool ascending) {
    setState(() {
      ordenAsendente = ascending;
      odernColum = columnIndex;
    });

    switch (_column[columnIndex]['orden'] as int) {
      case 0:
        orderbyId();
        break;
      case 1:
        orderbyPuntahe();
        break;
      case 2:
        orderbyAsierto();
        break;
      case 3:
        orderbyNivel();
        break;
      default:
    }
  }

  void orderbyId() {
    dataTable = widget.dataTable;

    dataTable?.sort((a, b) => a.id!);
    setState(() {});
  }

  void orderbyPuntahe() {
    dataTable = widget.dataTable;

    dataTable?.sort((a, b) {
      final aa = a.score ?? -1;
      final bb = b.score ?? -1;

      int compare = 0;
      if (ordenAsendente) {
        compare = bb.compareTo(aa);
      } else {
        compare = aa.compareTo(bb);
      }

      return compare;
    });
    setState(() {});
  }

  void orderbyAsierto() {
    dataTable = widget.dataTable;

    dataTable?.sort((a, b) {
      final aa = a.correctanswers ?? -1;
      final bb = b.correctanswers ?? -1;

      int compare = 0;
      if (ordenAsendente) {
        compare = bb.compareTo(aa);
      } else {
        compare = aa.compareTo(bb);
      }

      return compare;
    });
    setState(() {});
  }

  void orderbyNivel() {
    dataTable = widget.dataTable;

    dataTable?.sort((a, b) {
      final aa = a.level ?? "";
      final bb = b.level ?? "";

      int compare = 0;
      if (ordenAsendente) {
        compare = bb.compareTo(aa);
      } else {
        compare = aa.compareTo(bb);
      }

      return compare;
    });
    setState(() {});
  }
}

class UsuariosTable extends DataTableSource {
  final List<RegistroModel> dataTable;
  final SizeScreen sizeScreen;

  UsuariosTable({
    required this.dataTable,
    required this.sizeScreen,
  });

  @override
  int get rowCount => dataTable.length;

  @override
  DataRow? getRow(int index) {
    print("cambio de tamaños: $sizeScreen");
    final aux = dataTable[index];

    final style = GoogleFonts.getFont(
      'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return DataRow(
      cells: <DataCell>[
        DataCell(SelectableText(aux.id!.toString(), style: style)),
        DataCell(SelectableText(aux.nombrecompleto, style: style)),
        DataCell(SelectableText((aux.score ?? "").toString(), style: style)),
        DataCell(SelectableText((aux.correctanswers ?? "").toString(),
            style: style)),
        DataCell(SelectableText(aux.level ?? "", style: style)),
        DataCell(
            ElevatedButton(onPressed: () {}, child: const Text("Eliminar"))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
 */