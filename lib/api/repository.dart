import 'dart:convert';

import 'package:crud_app/api/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/posts'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Books> books = it.map((e) => Books.fromJson(e)).toList();
        // print(books);
        return books;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(int userId, int id, String title, String body) async {
    try {
      final Response = await http.post(Uri.parse(_baseUrl + '/posts'),
          body: {"userId": userId, "id": id, "title": title, "content": body});

      if (Response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future putData(int id, int userId, String title, String body) async {
  //   try {
  //     final response = await http.put(
  //         Uri.parse(_baseUrl + '/posts' + id.toString()),
  //         body: {'userId': userId, 'title': title, 'body': body});
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
