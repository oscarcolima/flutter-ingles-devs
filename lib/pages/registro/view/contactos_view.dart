import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/pages/registro/provider/registro_page_provaider.dart';
import 'package:flutter_ingles_devs/pages/registro/widgets/figura.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons.dart';

class ContactosView extends StatelessWidget {
  const ContactosView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    return CustomPaint(
      painter: MyPainter(),
      child: Center(
        child: SizedBox(
          width: 570,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Text(
                "¿Quieres aprender inglés en serio?",
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: const Color.fromRGBO(0, 31, 94, 1),
                  fontSize: [0, 1].contains(sizeScreen.index) ? 24 : 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: [0, 1].contains(sizeScreen.index) ? 10 : 50),
              Text(
                "Únete a nuestra comunidad en Discord, recibe semanalmente consejos de estudio de algunos de los profesores de inglés más populares de Internet. ",
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: [0, 1].contains(sizeScreen.index) ? 12 : 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
               SizedBox(height: [0,1].contains(sizeScreen.index) ?30:60),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff001F5E)),
                onPressed: () {
                  context.read<RegistroPageProvaider>().gotToForm();
                },
                icon: Icon(
                  TDTxNFIcons.nf_fa_discord,
                  color: Colors.white,
                  size:  [0,1].contains(sizeScreen.index)?18:null,
                ),
                label: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    "Empezar test",
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: [0,1].contains(sizeScreen.index)?14: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
               SizedBox(height:[0,1,2].contains(sizeScreen.index) ?100: 200),
              Text(
                "Síguenos en nuestras redes sociales",
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize:[0,1].contains(sizeScreen.index) ?20: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color(0xff1ea1f1),
                    
                    onPressed: () {},
                    child: Icon(
                      TDTxNFIcons.nf_fa_twitter,
                      color: Colors.white,
                      
                    ),
                  ),
                  const SizedBox(width: 5),
                  FloatingActionButton(
                    backgroundColor: const Color(0xffe12f6d),
                    
                    onPressed: () {},
                    child: Icon(
                      TDTxNFIcons.nf_fa_instagram,
                      color: Colors.white,
                      
                    ),
                  ),
                  const SizedBox(width: 5),
                  FloatingActionButton(
                    backgroundColor: const Color(0xff3c5997),
                    
                    onPressed: () {},
                    child: Icon(
                      TDTxNFIcons.nf_fa_facebook,
                      color: Colors.white,
                      
                    ),
                  ),
                  const SizedBox(width: 5),
                  FloatingActionButton(
                    backgroundColor: const Color(0xffcd201f),
                    
                    onPressed: () {},
                    child: Icon(
                      TDTxNFIcons.nf_fa_youtube,
                      color: Colors.white,
                      
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
