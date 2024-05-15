import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(50),
            child: Image.asset('assets/imgs/INGLES-PARA-DEVS_logo.png'),
          )),
          Expanded(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: textFieldDecoration("usuario"),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          obscureText: true,
                          decoration: textFieldDecoration("contraseña"),
                        ),
                        const SizedBox(height: 50),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(0, 31, 94, 1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 15),
                          ),
                          onPressed: () {},
                          child:  Text(
                            "Login",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
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
}
