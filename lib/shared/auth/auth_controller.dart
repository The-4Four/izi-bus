import 'package:flutter/widgets.dart';
import 'package:izi_bus/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  bool userIsAuthenticated = false;
  UserModel? user;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      user = user;
      userIsAuthenticated = true;

      Navigator.pushReplacementNamed(context, "/home");
    } else {
      userIsAuthenticated = false;

      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();

    await instance.setString("user", user.toJson());
  }

  Future<void> hasCurrentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));

    if (instance.containsKey('user')) {
      final foundUser = await instance.getString("user") as String;
      setUser(context, UserModel.fromJson(foundUser));
      return;
    }

    setUser(context, null);
    return;
  }
}
