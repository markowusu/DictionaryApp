import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grammarly/font/my_flutter_app_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';




class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        backgroundColor: HexColor("#04ae70"),
        title: Padding(
          padding: EdgeInsets.only(
            left: 50.0,
          ),
          child: Text(
            "Grammarly",
            style:
                GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w700),
            //  TextStyle(

            //   color: Colors.white,
            //   fontSize: 23,
            //   fontWeight: FontWeight.w700,
            // ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 4.0),
                child: ListTile(
                  leading: Icon(
                    Grammarly.icons8_grammarly,
                    color: HexColor("#05c780"),
                    size: 43.0,
                  ),
                  title: Text(
                    "The Grammarly keyboard is up and running. ",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: HexColor("#666666"),
                    ),
                    // TextStyle(
                    //   color: HexColor("#666666"),
                    //   fontWeight: FontWeight.w300,
                    //   fontSize: 15,
                    // ),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(
                  top: 3.0,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.keyboard,
                        color: HexColor("#05c780"),
                      ),
                      title: Text(
                        "Keyboard Customization",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                      onTap: () {},
                    ),
                    //  Divider(),

                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: HexColor("#05c780"),
                      ),
                      title: Text(
                        "Grammarly Settings",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        //  TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                      onTap: () {},
                    ),

                    //  Divider(),

                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.user,
                        color: HexColor("#05c780"),
                      ),
                      title: Text(
                        "Account",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                      onTap: () {},
                    ),

                    //  Divider(),

                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.comment,
                        color: HexColor("#05c780"),
                      ),
                      title: Text(
                        "Feedback",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                      onTap: () {},
                    ),

                    //  Divider(),

                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.teamspeak,
                        color: HexColor("#05c780"),
                      ),
                      title: Text(
                        "Support",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                      onTap: () {},
                    ),

                    //  Divider(),

                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.info,
                        color: HexColor("#05c780"),
                      ),
                      title: Text(
                        "About",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w300,
                        // ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
