import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shop_app/models/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userid;


  Future<void> _authenticate(String email, String password, String urlSegment) async{
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/$urlSegment?key=AIzaSyAOfGCUP9JZ4h_XgTIPpsl5j-sPKEE3OaU');
    try{
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
    }catch(error) {
      throw error;
    }
  }


  Future<void> signup(String email, String password) async {
   return _authenticate(email, password, 'accounts:signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'accounts:signInWithPassword');
  }
}