import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/providers/settingsProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class settingsTab extends StatefulWidget {

  @override
  State<settingsTab> createState() => _settingsTabState();
}

class _settingsTabState extends State<settingsTab> {
  @override
  Widget build(BuildContext context) {
    var sp= Provider.of<settingsProvider>(context);
    String defaultTheme;
    if(sp.currentTheme==ThemeMode.light)defaultTheme="Light";
    if(sp.currentTheme==ThemeMode.dark)defaultTheme="Dark";
    String defaultLang='English';
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Theme",style: GoogleFonts.montserrat(textStyle: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600)),),
          SizedBox(height: 8,),
          InkWell(
            onTap: () => showModalBottomSheet(context: context, builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                      onTap: (){
                        sp.setTheme(ThemeMode.light);
                        Navigator.pop(context);
                      },
                    child: Container(child: Text("Light",style: GoogleFonts.montserrat(textStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))),
                      )
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                      onTap: (){
                        sp.setTheme(ThemeMode.dark);
                        Navigator.pop(context);
                      },
                      child: Container(child: Text("Dark",style:GoogleFonts.montserrat(textStyle: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))),
                      )
                  ),
                ],
                ),
              );
            },),
            child: Container(child: sp.currentTheme==ThemeMode.light?Text("Light",style:GoogleFonts.montserrat(textStyle: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))):Text("Dark",style:GoogleFonts.montserrat(textStyle: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))),
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            decoration: BoxDecoration(
              color: myTheme.lightPrimary,
                border: Border.all(
                  color: myTheme.lightPrimary,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            )
            ),
          ),
        SizedBox(height: 20,),
        //  --------------------------------------- lang dialog ---------------------------------------
          Text("Language",style:GoogleFonts.montserrat(textStyle: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))),
          SizedBox(height: 8,),
          InkWell(
            onTap: () => showModalBottomSheet(context: context, builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                        onTap: (){
                          sp.changeLange('en');
                          Navigator.pop(context);
                        },
                        child: Container(child: Text("English",style:GoogleFonts.montserrat(textStyle: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))),
                        )
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                        onTap: (){
                          sp.changeLange('ar');
                          Navigator.pop(context);
                        },
                        child: Container(child: Text("العربية",style:GoogleFonts.montserrat(textStyle: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600)),),
                        )
                    ),


                  ],
                ),
              );
            },),
            child: Container(child: sp.currentLang=='en'?Text("English",style: GoogleFonts.montserrat(textStyle: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))):Text("العربية",style:GoogleFonts.montserrat(textStyle: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600))),
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                decoration: BoxDecoration(
                    color: myTheme.lightPrimary,
                    border: Border.all(
                      color: myTheme.lightPrimary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                )
            ),
          ),
          SizedBox(height: 30,),
          SvgPicture.asset("assets/settings.svg",width: 300,fit: BoxFit.contain,),
        ],
      ),
    );
  }
}
