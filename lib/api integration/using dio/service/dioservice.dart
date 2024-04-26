import 'package:dio/dio.dart';

class DioService{
  var url = "https://jsonplaceholder.typicode.com/posts";
  Future<dynamic> getData() async {
    Dio dio =Dio();                   // created the object
    return await dio.get(url,options:Options(
        responseType: ResponseType.json,method: 'GET')
    ).then((response) => response);

  }
}