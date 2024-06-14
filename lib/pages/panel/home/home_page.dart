import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/layout/panel_layout.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/filtro_view.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/_table_view.dart';
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

    final smoldTable = ![0,1,2].contains(sizeScreen.index);
    
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
                    headers: [
                      HeaderTable(fixedWidth: 100, nombre: "#", orden: true),
                      HeaderTable( nombre: "nombre"),
                      HeaderTable( nombre: "teléfono"),
                      HeaderTable( nombre: "correo"),
                    if(smoldTable) HeaderTable(fixedWidth: 110, nombre: "puntaje", orden: true),
                    if(smoldTable) HeaderTable(fixedWidth: 110, nombre: "aciertos", orden: true),
                      HeaderTable(fixedWidth: 100, nombre: "nivel", orden: true),
                      // HeaderTable(fixedWidth: 100, nombre: "acción"),
                    ],
                    body: dataTable?.map((e) => [
                      CellBodyTable(data: e.id.toString()),
                      CellBodyTable(data: e.nombrecompleto),
                      CellBodyTable(data: e.telefono),
                      CellBodyTable(data: e.email),
                      if(smoldTable) CellBodyTable(data: e.score?.toString()??""),
                      if(smoldTable) CellBodyTable(data: e.correctanswers?.toString()??""),
                      CellBodyTable(data: e.level?.toString()??""),
                    ]).toList()??[],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  void buscar(String val) {
    final aux = _dataTable
        ?.where((element) =>
            element.nombrecompleto.toLowerCase().contains(val.toLowerCase()) ||
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
