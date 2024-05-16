import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/table_view.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:provider/provider.dart';

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

  final textControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PrincipalLayout(
      body: ProxyProvider0<List<RegistroModel>?>(
        update: (context, value) => dataTable,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: TextField(
                    controller: textControler,
                    onSubmitted: buscar,
                    decoration: textFieldDecoration("Buscar"),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                Expanded(
                  child: TableView(
                    dataTable: dataTable,
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

  InputDecoration textFieldDecoration(String name) {
    return InputDecoration(
        // labelText: name,
        hintText: name,
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 1),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(0, 31, 94, 1),
          ),
        ),
        suffixIcon: IconButton(
            onPressed: () {
              textControler.text = "";
              buscar("");
            },
            icon: const Icon(Icons.clear)));
  }
}
