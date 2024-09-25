import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/src/shared/Network/local_network.dart';
import 'package:shopping/src/shared/constnts/constnts.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  // Future<void> register(
  //     {required String name,
  //     required String email,
  //     required String phone,
  //     required String password}) async {
  //   emit(RegisterLoading());
  //   Response response = await http
  //       .post(Uri.parse("https://student.valuxapps.com/api/register"), body: {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'password': password,
  //   });
  //   var responseBody = jsonDecode(response.body);
  //   if (responseBody['status'] == true) {
  //     emit(RegisterSuccess());
  //     print(responseBody);
  //   } else {
  //     emit(FaildToRegister(message: responseBody['meassage']));
  //   }
  // }
  void register(
      {required String email,
      required String name,
      required String phone,
      required String password}) async {
    emit(RegisterLoading());
    try {
      Response response = await http.post(
        // request Url = base url + method url ( endpoint ) = https://student.valuxapps.com + /api/register
        Uri.parse('https://student.valuxapps.com/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'image': "jdfjfj" // الصوره مش شغاله بس لازم ابعت قيمه ك value
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          debugPrint("Response is : $data");
          emit(RegisterSuccess());
        } else {
          debugPrint("Response is : $data");
          emit(FaildToRegister(message: data['message']));
        }
      }
    } catch (e) {
      debugPrint("Failed to Register , reason : $e");
      emit(FaildToRegister(message: e.toString()));
    }
  }

//hhedet85563@evvgo.com
  // void login({required String email, required String password}) async {
  //   emit(loginLoading());
  //   try {
  //     Response response = await http.post(
  //       // request => url = base url + method url
  //       Uri.parse('https://student.valuxapps.com/api/login'),
  //       body: {'email': email, 'password': password},
  //     );
  //     if (response.statusCode == 200) {
  //       var responseData = jsonDecode(response.body);
  //       if (responseData['status'] == true) {
  //         // debugPrint("User login success and his Data is : ${responseData['data']['token']}");
  //         await CacheNetwork.insertToCache(
  //             key: "token", value: responseData['data']['token']);
  //         await CacheNetwork.insertToCache(key: "password", value: password);
  //         token = await CacheNetwork.getCacheData(key: "token");
  //         currentpassword = await CacheNetwork.getCacheData(key: "password");
  //         emit(loginSuccess());
  //       } else {
  //         debugPrint("Failed to login, reason is : ${responseData['message']}");
  //         emit(Faildlogin(message: responseData['message']));
  //       }
  //     }
  //   } catch (e) {
  //     emit(Faildlogin(message: e.toString()));
  //   }
  // }

  void login({required String email, required String password}) async {
    final http = Client();
    final url = Uri.parse('https://student.valuxapps.com/api/login');
    final body = {'email': email, 'password': password};
    emit(loginLoading());
    try {
      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          await CacheNetwork.insertToCache(
              key: "token", value: responseData['data']['token']);
          await CacheNetwork.insertToCache(key: "password", value: password);
          token = await CacheNetwork.getCacheData(key: "token");
          currentpassword = await CacheNetwork.getCacheData(key: "password");
          emit(loginSuccess());
        } else {
          print("Failed to login, reason is : ${responseData['message']}");
          emit(Faildlogin(message: responseData['message']));
        }
      }
    } catch (e) {
      emit(Faildlogin(message: e.toString()));
    }
  }

  // String? chosenValue;
  // void changeDropDownValue({required String val})
  // {
  //   chosenValue = val;
  //   emit(ChangeValueSuccessState());
  // }
  // void login({required String email, required String password}) async {
  //   emit(loginLoading());
  //   Response response = await http
  //       .post(Uri.parse("https://student.valuxapps.com/api/login"), body: {
  //     'email': email,
  //     'password': password,
  //   });
  //   if (response.statusCode == 200) ;
  //   var data = jsonDecode(response.body);
  //   if (data['status'] == true) {
  //     emit(loginSuccess());
  //   } else {
  //     print("faild is login, reason is :${data['message']}");
  //     emit(Faildlogin(message: data['message']));
  //   }
  // }
}
//hhedet85563@evvgo.com
//test1234
//0911223344