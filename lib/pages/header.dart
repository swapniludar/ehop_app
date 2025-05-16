import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';


class EhopHeader extends StatelessWidget {
  const EhopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Text(
              "ehop",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 35,
                fontWeight: FontWeight.w900,//FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),*/
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                        text: "ehop - ",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 35,
                          fontWeight: FontWeight.w900,//FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      TextSpan(
                        text: "Hi, Pratik ",
                        style: GoogleFonts.actor(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,//FontWeight.w700,
                          fontStyle: FontStyle.normal,

                        ),
                      )
                    ]
                )
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Ionicons.notifications_outline)),
          Icon(
              Ionicons.logo_skype
          )
        ],
      ),

    );
  }
}