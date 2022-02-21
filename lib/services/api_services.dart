import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterallapimethod/models/usermodel.dart';
import 'package:http/http.dart' as http;

class Apiservices {
  Future<Usermodel?> createdata(
      {required String id, required String name, required String job}) async {
    print(id);
    print(name);
    print(job);
    var url = 'https://fakerestapi.azurewebsites.net/api/v1/Users';
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final msg = jsonEncode({"id":id,"userName": name, "password": job});

    final response =
        await http.post(Uri.parse(url), headers: header, body: msg);

    if (response.statusCode == 200) {
      print(response.body);
      return usermodelFromJson(response.body);
    }
  }

  Future<Usermodel?> getdata(String id) async {
    print(id);
    final response =
        await http.get(Uri.parse('https://fakerestapi.azurewebsites.net/api/v1/Users/'));
    print('getdataresponse=======');
    print(response.body);
    print('getdatastatuscode=======');
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  Future<Usermodel?> updatedata(String id) async {
    print(id);
    var url = 'https://fakerestapi.azurewebsites.net/api/v1/Users/';
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final msg = jsonEncode({"id":id,"userName": 'pratik', "password": '123456'});
    final response =
    await http.put(Uri.parse(url+id),body: msg,headers: header);
    print('Updatedataresponse=======');
    print(response.body);
    print('getdatastatuscode=======');
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
