import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:grammarly/font/my_flutter_app_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

void main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData(
      //   primarySwatch: Colors.black26,
      // ),
      home: SearchForm(),
    );
  }
}

class SearchForm extends StatefulWidget {
  SearchForm({Key key}) : super(key: key);

  final dio = Dio(
      // BaseOptions(
      //   // baseUrl:
      //   //     "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/",
      //   headers: {
      //     "Authorization":  DotEnv.env['MW_THESAURUS_KEY'],
      //   },
      // ),
      );

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var wrapList;
  Map data;
  List userData;
  final _formKey = GlobalKey<FormState>();
  // Future<Response> responseData;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _isValid = false;

  @override
  void initState() {
    super.initState();


  }


  searchWord(String query) async {
    final data = await widget.dio.get(
        "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/$query?key=16d72105-5d33-4add-bfe8-664e4668e09e");

    setState(() {
      userData = data.data[0]['meta']['syns'][0].toList();
      print(userData);
    });
    // if (data.statusCode == 200) {
    //   return true;
    // } else {
    //   return false;
    // }
    // return data.data[0]['meta']['syns'];
  }

  @override
  Widget build(BuildContext context) {
    var search;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                child: Form(
                  key: _formKey,
                  autovalidateMode: _autoValidate,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "search a word",
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),

                        // This validator returns a string when the search is empty
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Type a search term";
                          }
                          // if all is correct return null

                          return null;
                        },

                        // This is an onChange property of the TextFormField that passes
                        // the value typed to the search identifier/ variable.
                        onChanged: (value) {
                          search = value;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: TextButton(
                          onPressed: () {
                            final isValidate = _formKey.currentState.validate();
                            if (isValidate) {
                              // when everything is valid
                              // print(DotEnv.env['MW_THESAURUS_KEY']);
                              searchWord(search);

                              // print(userData);
                              setState(() {
                                _isValid = true;
                                // wrapList = getbody() ;
                                // wrapList = chipWithinList();
                              });
                            } else {
                              // this sets the auto validation value is invalid.
                              setState(() {
                                _autoValidate =
                                    AutovalidateMode.onUserInteraction;
                              });
                            }
                          },
                          child: Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Tex(userData[0][3].toString()),
              Expanded(
                child: _isValid ? getbody() : Container(height: 0, width: 0),
              ),

              // Wrap(
              //   children:

              //       _isValid ? Row(children:wrapList ): [Container()],
              //   spacing: 3.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getbody() {
    if (userData.contains(null) || userData.length == 0) {
      return CircularProgressIndicator();
    }
    return ListView.builder(
      itemCount: userData.length >= 4 ? 6 : 2,
      itemBuilder: (BuildContext context, int index) {
        return Chip(label: Text(userData[index].toString()));
      },
    );
  }

  // List chipWithinList( ) {
  //   return (List.generate( 4,(int index){
  //     return(
  //   new Chip(
  //     elevation: 4.0,
  //     label: Text(userData[index].toString()), //responseData['syn'][0][1],
  //     backgroundColor: Colors.white10,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //     shadowColor: Colors.black26,

  //   ));
  // }));

}
