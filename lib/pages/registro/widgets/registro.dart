import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/data/model/tecnologias_model.dart';
import 'package:flutter_ingles_devs/pages/registro/provider/registro_page_provaider.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons.dart';
import 'package:tdtxle_data_format/formatter/phone_input_formatter.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    try {
      listaDeOpciones = await IngesDevApi.registro().getTecnologias() ?? [];
      setState(() {});
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  RegistroModel registro = RegistroModel();
  List<TecnologiasModel> listaDeOpciones = [];

  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final tituloStyle = GoogleFonts.getFont(
      'Poppins',
      color: const Color.fromRGBO(0, 31, 94, 1),
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );

    final inputStyle = GoogleFonts.getFont(
      'IBM Plex Sans',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    final List<String> _countryCodes = [
      '+52', // México
      '+54', // Argentina
      '+56', // Chile
      '+57', // Colombia
      '+58', // Venezuela
      '+51', // Perú
    ];
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    String _selectedCode = '+52';
    String _experiencia = '0';

    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        key: context.read<RegistroPageProvaider>().keyResitroForm,
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descubre tu nivel de Inglés",
                  style: tituloStyle,
                ),
                const SizedBox(height: 35),
                TextFormField(
                  style: inputStyle,
                  decoration: textFieldDecoration("Nombre completo"),
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Complete el campo";
                    }

                    registro.nombreCompleto = value!;
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: inputStyle,
                  decoration: textFieldDecoration("Correo electrónico"),
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Complete el campo";
                    }

                    // Validación con expresión regular
                    if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value ?? "")) {
                      return 'Por favor ingrese un correo electrónico válido';
                    }

                    registro.email = value!;
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: inputStyle,
                  decoration: textFieldDecoration("¿Cuál es tu profesión?"),
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Complete el compo";
                    }

                    registro.profesion = value!;
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // Dropdown for country code
                    Flexible(
                      flex: 3, // 20% del ancho total
                      child: DropdownButtonFormField<String>(
                        value: _selectedCode,
                        onChanged: (String? newValue) {
                          registro.codigoPais != newValue;
                          setState(() {
                            _selectedCode = newValue!;
                          });
                        },
                        items: [
                          {'code': '+52', 'flag': 'mx'}, // México
                          {'code': '+54', 'flag': 'ar'}, // Argentina
                          {'code': '+56', 'flag': 'cl'}, // Chile
                          {'code': '+57', 'flag': 'co'}, // Colombia
                          {'code': '+58', 'flag': 've'}, // Venezuela
                          {'code': '+51', 'flag': 'pe'}, // Perú
                          {'code': '+503', 'flag': 'sv'}, // El Salvador
                          {'code': '+502', 'flag': 'gt'}, // Guatemala
                          {'code': '+505', 'flag': 'ni'}, // Nicaragua
                          {'code': '+506', 'flag': 'cr'}, // Costa Rica
                          {'code': '+507', 'flag': 'pa'}, // Panamá
                          {'code': '+593', 'flag': 'ec'}, // Ecuador
                          {'code': '+591', 'flag': 'bo'}, // Bolivia
                          {'code': '+598', 'flag': 'uy'}, // Uruguay
                          {'code': '+595', 'flag': 'py'}, // Paraguay
                          {'code': '+53', 'flag': 'cu'}, // Cuba
                          {
                            'code': '+809',
                            'flag': 'do'
                          }, // República Dominicana
                          {'code': '+787', 'flag': 'pr'}, // Puerto Rico
                        ].map((Map<String, String> country) {
                          return DropdownMenuItem<String>(
                            value: country['code'],
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/flags/${country['flag']}.png',
                                  width: 24,
                                  height: 16,
                                  fit: BoxFit.cover,
                                ), // Imagen de la bandera
                                const SizedBox(
                                    width:
                                        8), // Espaciado entre bandera y código
                                Text(country['code'] ?? ''), // Código del país
                              ],
                            ),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Código',
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Spacing between dropdown and text field
                    // Text field for phone number
                    Flexible(
                      flex: 7, // 80% of the row
                      child: TextFormField(
                        style: inputStyle,
                        inputFormatters: [PhoneInputFormatter()],
                        validator: (value) {
                          if ((value ?? "").isEmpty) {
                            return "Complete el compo";
                          }
                          if (int.tryParse(value?.replaceAll('-', '') ?? "") ==
                              null) {
                            return "Solo numeros";
                          }

                          if ((value?.replaceAll('-', '') ?? "").length != 10) {
                            return "Teléfono no valido";
                          }

                          registro.telefono = value!;
                          return null;
                        },
                        decoration: textFieldDecoration("Teléfono"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _experiencia,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      registro.experiencia =
                          newValue == "20" ? ">20" : newValue; // Manejar ">20"
                      setState(() {
                        _experiencia = newValue;
                      });
                    }
                  },
                  items: List<DropdownMenuItem<String>>.generate(
                    21, // Generar números del 1 al 20
                    (index) {
                      final value = index;
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value == 20
                            ? '>20'
                            : value.toString()), // Cambiar el texto para 20
                      );
                    },
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Seleccione un valor";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "¿Cuántos años de experiencia tienes?",
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  items: generarLista(listaDeOpciones),
                  onChanged: (value) {},
                  isDense: true,
                  isExpanded: true,
                  decoration: textFieldDecoration(
                      "¿Con qué tecnología trabajas principalmente?"),
                  validator: (value) {
                    if (value == null) {
                      return "Seleccione Area";
                    }

                    registro.technology = value;

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Ocupa todo el ancho disponible
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 31, 94, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    onPressed: registrar,
                    child: const Text("Comenzar"),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Al hacer clic en “Comenzar” acepto el uso de mis datos personales de acuerdo con la Política de Privacidad y recibir las últimas noticias, ofertas e información sobre lInglés para Devs por email.",
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(String name) {
    return InputDecoration(
      labelText: name,
      hintText: name,
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 1),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(0, 31, 94, 1),
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> generarLista(List<TecnologiasModel> lista) {
    return lista.map((e) {
      return DropdownMenuItem(
        value: e.id,
        child: SizedBox(
          width: double.infinity,
          child: ListTile(
            title: Text(e.technology),
            leading: Icon(TDTxNFIcons.fromCLass(e.icon)),
          ),
        ),
      );
    }).toList();
  }

  void registrar() async {
    if (_keyForm.currentState!.validate()) {
      try {
        //http://localhost:5015/api/Registro/tecnologias

        final newRegistro = await IngesDevApi.registro().registrar(registro);
        if (newRegistro != null) {
          var box = Hive.box('registro');
          box.putAll(newRegistro.toMap());
          // ignore: use_build_context_synchronously
          context.go('/test');
        }
      } catch (e) {
        // ignore: avoid_print, use_build_context_synchronously
        ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
            content: Text(e.toString()),
            actions: [
              TextButton(onPressed: () {}, child: const Text("hola"))
            ]));
        // ignore: avoid_print
        print(e);
      }
    }
  }
}
