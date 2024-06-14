import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/layout/panel_layout.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/filtro_view.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/tabla_view/tabla_model.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:provider/provider.dart';

import 'view/tabla_view/tabla_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RegistroModel>? _dataTable;
  List<RegistroModel>? dataTable;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    print(sizeScreen);

    return PanelLayout(
      body: ProxyProvider0<List<RegistroModel>?>(
        update: (context, value) => dataTable,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Column(
              children: [
                FiltroView(buscar: buscar),
                const Divider(),
                const SizedBox(height: 20),
                Expanded(
                  child: TablaView(
                    headers: headers(sizeScreen),
                    body: dataTable?.map((e) => row(sizeScreen, e)).toList() ??
                        [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<HeaderTable> headers(SizeScreen sizeScreen) {
    return switch (sizeScreen) {
      SizeScreen.xs => [
          HeaderTable(fixedWidth: 100, nombre: "#", orden: true),
          HeaderTable(nombre: "nombre"),
          HeaderTable(fixedWidth: 100, nombre: "nivel", orden: true),
        ],
      SizeScreen.sm => [
          HeaderTable(fixedWidth: 100, nombre: "#", orden: true),
          HeaderTable(nombre: "nombre"),
          HeaderTable(nombre: "teléfono"),
          HeaderTable(nombre: "correo"),
          HeaderTable(fixedWidth: 100, nombre: "nivel", orden: true),
        ],
      SizeScreen.lg => [
          HeaderTable(fixedWidth: 100, nombre: "#", orden: true),
          HeaderTable(nombre: "nombre"),
          HeaderTable(nombre: "teléfono"),
          HeaderTable(nombre: "correo"),
          HeaderTable(fixedWidth: 100, nombre: "nivel", orden: true),
        ],
      _ => [
          HeaderTable(fixedWidth: 100, nombre: "#", orden: true),
          HeaderTable(nombre: "nombre"),
          HeaderTable(nombre: "teléfono"),
          HeaderTable(nombre: "correo"),
          HeaderTable(fixedWidth: 110, nombre: "puntaje", orden: true),
          HeaderTable(fixedWidth: 110, nombre: "aciertos", orden: true),
          HeaderTable(fixedWidth: 100, nombre: "nivel", orden: true),
        ]
    };
  }

  List<CellBodyTable> row(SizeScreen sizeScreen, RegistroModel registro) {
    return switch (sizeScreen) {
      SizeScreen.xs => [
          CellBodyTable(data: registro.id.toString()),
          CellBodyTable(data: registro.nombreCompleto),
          CellBodyTable(data: registro.level?.toString() ?? ""),
        ],
      SizeScreen.sm => [
          CellBodyTable(data: registro.id.toString()),
          CellBodyTable(data: registro.nombreCompleto),
          CellBodyTable(data: registro.telefono),
          CellBodyTable(data: registro.email),
          CellBodyTable(data: registro.level?.toString() ?? ""),
        ],
      SizeScreen.lg => [
          CellBodyTable(data: registro.id.toString()),
          CellBodyTable(data: registro.nombreCompleto),
          CellBodyTable(data: registro.telefono),
          CellBodyTable(data: registro.email),
          CellBodyTable(data: registro.level?.toString() ?? ""),
        ],
      _ => [
          CellBodyTable(data: registro.id.toString()),
          CellBodyTable(data: registro.nombreCompleto),
          CellBodyTable(data: registro.telefono),
          CellBodyTable(data: registro.email),
          CellBodyTable(data: registro.score?.toString() ?? ""),
          CellBodyTable(data: registro.correctaAnswers?.toString() ?? ""),
          CellBodyTable(data: registro.level?.toString() ?? ""),
        ]
    };
  }

  void buscar(String val) {
    final aux = _dataTable
        ?.where((element) =>
            element.nombreCompleto.toLowerCase().contains(val.toLowerCase()) ||
            element.email.toLowerCase().contains(val.toLowerCase()) ||
            element.telefono.toLowerCase().contains(val.toLowerCase()) ||
            (element.level?.toLowerCase() ?? "").contains(val.toLowerCase()))
        .toList();
    setState(() {
      dataTable = aux;
    });
  }

  void getData() async {
    _dataTable = await IngesDevApi.panel().getPanel();

    setState(() {
      dataTable = _dataTable;
    });
  }
}
