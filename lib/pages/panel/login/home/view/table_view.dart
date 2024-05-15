// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TableView extends StatefulWidget {
  final List<RegistroModel>? dataTable;
  const TableView({
    super.key,
    this.dataTable,
  });

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  int? odernColum;
  bool ordenAsendente = false;

  @override
  void initState() {
    dataTable = widget.dataTable;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TableView oldWidget) {
    dataTable = widget.dataTable;
    odernColum = null;
    ordenAsendente = false;
    super.didUpdateWidget(oldWidget);
  }

  final _colum = [
    {'titulo': "#", 'orden': 0},
    {'titulo': "nombre completo", 'orden': null},
    {'titulo': "telefono", 'orden': null},
    {'titulo': "correo", 'orden': null},
    {'titulo': "puntaje", 'orden': 1},
    {'titulo': "Asiertos", 'orden': 2},
    {'titulo': "nivel", 'orden': 3},
  ];

  List<RegistroModel>? dataTable;

  @override
  Widget build(BuildContext context) {
   
    final tema = Theme.of(context).copyWith(
        cardTheme: const CardTheme(color: Colors.white, elevation: 0));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        constraints: BoxConstraints(minWidth: 1400, maxWidth: 1400),
        child: Theme(
          data: tema,
          child: PaginatedDataTable2(
            sortColumnIndex: odernColum,
            sortAscending: ordenAsendente,
            columnSpacing: 100,
            columns: generarColumnas(),
            source: UsuariosTable(dataTable: dataTable ?? []),
          ),
        ),
      ),
    );
  }

  List<DataColumn> generarColumnas() {
    List<DataColumn> colums = [];
    for (var i = 0; i < _colum.length; i++) {
      final col = _colum[i];
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

      if (["nombre completo", "correo"].contains(col['titulo'] as String)) {
        colums.add(DataColumn2(
          size: ColumnSize.L,
          onSort: (col['orden'] == null) ? null : orderby,
          label: label,
        ));
      } else if (["#", 'puntaje', 'Asiertos']
          .contains(col['titulo'] as String)) {
        colums.add(DataColumn2(
          size: ColumnSize.S,
          // fixedWidth: (col['titulo'] as String) == "#" ? 100 : null,
          onSort: (col['orden'] == null) ? null : orderby,
          label: label,
        ));
      } else {
        colums.add(DataColumn2(
          onSort: (col['orden'] == null) ? null : orderby,
          label: label,
        ));
      }
    }
    return colums;
  }

  void orderby(int columnIndex, bool ascending) {
    setState(() {
      ordenAsendente = ascending;
      odernColum = columnIndex;
    });

    switch (_colum[columnIndex]['orden'] as int) {
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
  UsuariosTable({required this.dataTable});

  @override
  int get rowCount => dataTable.length;

  @override
  DataRow? getRow(int index) {
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
        DataCell(SelectableText(aux.telefono, style: style)),
        DataCell(SelectableText(aux.email, style: style)),
        DataCell(SelectableText((aux.score ?? "").toString(), style: style)),
        DataCell(SelectableText((aux.correctanswers ?? "").toString(),
            style: style)),
        DataCell(SelectableText(aux.level ?? "", style: style)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
