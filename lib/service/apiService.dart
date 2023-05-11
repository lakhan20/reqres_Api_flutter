


import 'dart:convert';

import 'package:http/http.dart';
import 'package:reqresapi/model/data.dart';

class ApiService{

  final endpoint="https://reqres.in/api/users?page=2";

  Future<List<Data>> getData() async{
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode==200)
      {
        Map<dynamic,dynamic> json=jsonDecode(response.body);
        List<dynamic> body=json['data'];
        List<Data> data=body.map((dynamic item) => Data.fromJson(item)).toList();
        return data;

      }
    else{
      throw "data not found";

    }

  }



}
