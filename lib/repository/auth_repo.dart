import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/core/config.dart';
import 'package:task/models/user_model.dart';


class AuthRepo{

  UserModel userModel=UserModel();
  login(String email , String password) async {
    http.Response response = await http.post(
        Uri.parse('$apiKey/auth/login'),
        body: {
          "email": email,
          "password": password
        }

    );
    try{
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
         userModel = UserModel.fromJson(body);
         return userModel;
      }else{
        print('status code == ${response.statusCode}');
      }

    }catch(e){
      print(e.toString());
    }
  }



}