import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'tabla_model.dart';

class TablaView extends StatefulWidget {
  final List<HeaderTable> headers;
  final List<List<CellBodyTable>> body;
  const TablaView({super.key, required this.headers, required this.body});

  @override
  State<TablaView> createState() => _TablaViewState();
}

class _TablaViewState extends State<TablaView> {
  late int sortColumnIndex;
  bool sortAscending = true;

  late List<List<CellBodyTable>> body;
  @override
  void initState() {
    super.initState();
    sortColumnIndex = widget.headers.indexWhere((element) => element.orden);
    body = widget.body;
  }

  @override
  void didUpdateWidget(TablaView oldWidget) {
    super.didUpdateWidget(oldWidget);
    sortColumnIndex = widget.headers.indexWhere((element) => element.orden);
    body = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).copyWith(
        cardTheme: const CardTheme(color: Colors.white, elevation: 0));

    return Theme(
      data: tema,
      child: PaginatedDataTable2(
        // minWidth: 500,
        columnSpacing: 5,
        horizontalMargin: 10,
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
        columns: headers(),
        source: SourceDataTable(body),
      ),
    );
  }

  List<DataColumn> headers() {
    List<DataColumn> aux = [];
    for (var i = 0; i < widget.headers.length; i++) {
      final row = widget.headers[i];

      final label = Row(
        children: [
          Text(
            row.nombre,
            style: GoogleFonts.getFont(
              'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (row.orden) const Icon(Icons.filter_alt_rounded, size: 15)
        ],
      );

      aux.add(
        DataColumn2(
          fixedWidth: row.fixedWidth,
          label: label,
          onSort: !row.orden ? null : orderBy,
        ),
      );
    }

    return aux;
  }

  void orderBy(int columnIndex, bool ascending) {
    var auxDataTable = widget.body;

    if (ascending) {
      auxDataTable
          .sort((a, b) => b[columnIndex].data.compareTo(a[columnIndex].data));
    } else {
      auxDataTable
          .sort((a, b) => a[columnIndex].data.compareTo(b[columnIndex].data));
    }

    // auxDataTable?.sort((a, b) {
    //   final aa = a.score ?? -1;
    //   final bb = b.score ?? -1;

    //   int compare = 0;
    //   if (ascending) {
    //     compare = bb.compareTo(aa);
    //   } else {
    //     compare = aa.compareTo(bb);
    //   }

    //   return compare;
    // });

    setState(() {
      sortAscending = ascending;
      sortColumnIndex = columnIndex;
      body = auxDataTable;
    });
  }
}

class SourceDataTable extends DataTableSource {
  final List<List<CellBodyTable>> dataTable;

  SourceDataTable(this.dataTable);

  @override
  int get rowCount => dataTable.length;

  @override
  DataRow? getRow(int index) {
    final row = dataTable[index];

    final style = GoogleFonts.getFont(
      'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return DataRow(
        cells: row
            .map(
              (e) => DataCell(
                SelectableText(e.data, style: style),
              ),
            )
            .toList()
        // [
        //   DataCell(SelectableText(aux.id!.toString(), style: style)),
        //   DataCell(SelectableText(aux.nombrecompleto, style: style)),
        //   DataCell(SelectableText((aux.score ?? "").toString(), style: style)),
        //   DataCell(SelectableText((aux.correctanswers ?? "").toString(),
        //       style: style)),
        //   DataCell(SelectableText(aux.level ?? "", style: style)),
        //   DataCell(
        //       ElevatedButton(onPressed: () {}, child: const Text("Eliminar"))),
        // ],
        );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
