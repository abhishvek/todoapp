import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoProvider extends ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic> todoData;
  Map<String, String> customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };

  //Get request
  Future fetchData() async {
    final Uri restAPIURL =
        Uri.parse("https://todoflutternodejs.herokuapp.com/");
    http.Response response = await httpClient.get(restAPIURL);
    final Map parsedData = await json.decode(response.body.toString());
    todoData = parsedData['data'];
    print(todoData);
  }

  //Post request
  Future addData(Map<String, String> body) async {
    final Uri restAPIURL =
        Uri.parse("https://todoflutternodejs.herokuapp.com/add");
    http.Response response = await httpClient.post(restAPIURL,
        headers: customHeaders, body: jsonEncode(body));
    return response.body;
  }

  //Delete request
  Future deleteData(String id) async {
    final Uri restAPIURL =
        Uri.parse("https://todoflutternodejs.herokuapp.com/delete");

    http.Response response = await httpClient
        .delete(restAPIURL, headers: customHeaders, body: {"id": id});
    return response.body;
  }
}
