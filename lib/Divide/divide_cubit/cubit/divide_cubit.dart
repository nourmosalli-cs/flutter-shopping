import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/src/models/banners_model.dart';
import 'package:shopping/src/models/categories_model.dart';
import 'package:shopping/src/models/home_model.dart';
import 'package:shopping/src/models/produc_tmodel.dart';
import 'package:shopping/src/models/user_model.dart';
import 'package:shopping/src/screen/auth/Favorite_screen/favorite_screen.dart';
import 'package:shopping/src/screen/auth/Profile_screen/screen/account_screen.dart';
import 'package:shopping/src/screen/auth/cart_screen/cart_screen.dart';
import 'package:shopping/src/screen/auth/categories_screen/categories_screen.dart';
import 'package:shopping/src/screen/auth/home_screen/home_screen.dart';
import 'package:shopping/src/shared/Network/local_network.dart';
import 'package:shopping/src/shared/constnts/constnts.dart';
part 'divide_state.dart';

class DivideCubit extends Cubit<DivideState> {
  DivideCubit() : super(DivideInitial());

  int bottomNavIndex = 2;
  List<Widget> DivideScreen = [
    const FavoriteScreen(),
    const CategoriesScreen(),
    HomeScreen(),
    const CartScreen(),
    AccountScreen(),
  ];
  void changeBottomNavIndex({required int index}) {
    bottomNavIndex = index;
    // Emit state
    emit(ChangeBottomNavIndexState());
  }

  UserModel? userModel;
  void getUserData() async {
    emit(GetUserDataLoadingState());
    Response response = await http
        .get(Uri.parse("https://student.valuxapps.com/api/profile"), headers: {
      'Authorization': token!,
      'Lang': "en",
    });
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      userModel = UserModel.fromJson(data: responseData['data']);
      print("response is :$responseData");
      emit(GetUserDataSuccessState());
    } else {
      print("response is :$responseData");
      emit(FailedToUserDataState(error: responseData['message']));
    }
  }

  List<BannersModel> banners = [];
  void getBannerData() async {
    emit(GetBannerDataLoadingState());
    Response response = await http.get(
      Uri.parse("https://student.valuxapps.com/api/banners"),
    );
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      for (var item in responseData['data']) {
        banners.add(BannersModel.fromjson(data: item));
        print("response is :$responseData");
        emit(GetBannerDataSuccessState());
      }
    } else {
      emit(FailedToBannerState());
      print("response is :$responseData");
    }
  }

  List<CategoriesModel> categores = [];
  Future<void> getCategoriesData() async {
    Response response = await http
        .get(Uri.parse("https://student.valuxapps.com/api/categories"));
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      for (var item in responseData['data']['data']) {
        categores.add(CategoriesModel.fromjson(data: item));
        emit(GetCategoresDataScccessState());
      }
    } else {
      emit(FailedToCategoresState());
    }
  }

  List<ProductModel> favorites = [];
  Set<String> favoritesID = {}; //set لانو مافي تكرار
  Future<void> getFavoritesData() async {
    favorites.clear();
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/favorites"),
        headers: {
          'Authorization': token!,
          'Lang': "en",
        });
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      for (var item in responseData['data']['data']) {
        favorites.add(ProductModel.fromJson(data: item['product']));
        favoritesID.add(item['product']['id'].toString());
        emit(GetProducSuccessState());
      }
    } else {
      emit(FailedToProducState());
    }
  }

  void addorRemoveFavorites({required String productID}) async {
    Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/favorites"),
        headers: {
          'Authorization': token!,
          'Lang': "en",
        },
        body: {
          'product_id': productID,
        });
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      if (favoritesID.contains(productID) == true) {
        favoritesID.remove(productID);
      } else {
        favoritesID.add(productID);
      }
      await getFavoritesData();
      emit(AddorRemoveFavoritesSuccessState());
    } else {
      emit(FailedaddorRemoveFavoritesState());
    }
  }

  List<ProductModel> Cart = [];
  Set<String> cartsID = {};
  int totalPrice = 0;
  Future<void> getcarts() async {
    Response response = await http
        .get(Uri.parse("https://student.valuxapps.com/api/carts"), headers: {
      'Authorization': token!,
      'Lang': "en",
    });
    var responesData = jsonDecode(response.body);
    if (responesData['status'] == true) {
      for (var item in responesData['data']['cart_items']) {
        cartsID.add(item['product']['id'].toString());
        Cart.add(ProductModel.fromJson(data: item['product']));
        print(responesData);
        emit(GetcartsSuccessState());
      }
    } else {
      emit(FailedgetcartsState());
      print(responesData);
    }
  }

  void addorRemoveCarts({required String id}) async {
    Response response = await http
        .post(Uri.parse("https://student.valuxapps.com/api/carts"), headers: {
      'Authorization': token!,
      'Lang': "en",
    }, body: {
      'product_id': id,
    });
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      if (cartsID.contains(id) == true) {
        cartsID.remove(id);
      } else {
        cartsID.add(id);
      }
      await getcarts();
      emit(AddorRemoveCartsSuccessState());
    } else {
      emit(FailedaddorRemoveCartsState());
    }
  }

  List<HomeModel> home = [];
  void getHomeData() async {
    Response response = await http.get(
        Uri.parse("https://student.valuxapps.com/api/home"),
        headers: {'Authorization': token!, 'lang': "en"});
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      for (var item in responseData['data']['products']) {
        home.add(HomeModel.fromJson(data: item));
        emit(GetHomeSuccessState());
      }
    } else {
      emit(FailedToHomeState());
    }
  }

  List<HomeModel> filteredHome = [];
  void filterHome({required String input}) {
    filteredHome = home
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(filteredHomeState());
  }

  // void changePassword(
  //     {required String usercurrentpassword,
  //     required String newpassword,
  //     required useruserCurrentPassword}) async {
  //   emit(ChangePasswordLoadingState());
  //   Response response = await http.post(
  //       Uri.parse("https://student.valuxapps.com/api/change-password"),
  //       headers: {
  //         'Authorization': token!,
  //         'Lang': "en",
  //       },
  //       body: {
  //         "current_password": usercurrentpassword,
  //         "new_password": newpassword,
  //       });
  //   var responseData = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     if (responseData['status'] == true) {
  //       await CacheNetwork.insertToCache(key: 'password', value: newpassword);
  //       currentpassword = await CacheNetwork.getCacheData(key: "password");
  //       emit(ChangePasswordSuccessState());
  //     } else {
  //       emit(ChangePasswordFailedState(error: responseData['message']));
  //     }
  //   } else {
  //     emit(ChangePasswordFailedState(error: responseData['message']));
  //   }
  // }
  void changePassword(
      {required String userCurrentPassword,
      required String newPassword}) async {
    emit(ChangePasswordLoadingState());
    Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/change-password"),
        headers: {
          'lang': 'ar',
          'Authorization': token!
        },
        body: {
          'current_password': userCurrentPassword,
          'new_password': newPassword,
        });
    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseDecoded['status'] == true) {
        await CacheNetwork.insertToCache(key: 'password', value: newPassword);
        currentpassword = await CacheNetwork.getCacheData(key: "password");
        emit(ChangePasswordSuccessState());
      } else {
        emit(ChangePasswordFailedState(error: responseDecoded['message']));
      }
    } else {
      emit(ChangePasswordFailedState(error: responseDecoded['message']));
    }
  }
}
