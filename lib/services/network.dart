//  import 'package:flutter/material.dart';
//  Future searchWord(String query) async {
//     // print(DotEnv.env['MW_THESAURUS_KEY']);
//     final response = await widget.dio.get(
//       "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/$query?key=16d72105-5d33-4add-bfe8-664e4668e09e",
//       // queryParameters: {
//       //   "value": query,
//       // },
//     );
//     // var data = jsonDecode(response.data);
//     // print(data);
//     // return response.data[0]['meta']['syns'][0][1];
//     print(response.data[0]['meta']);
//     return response.data[0]['meta'];
//  }