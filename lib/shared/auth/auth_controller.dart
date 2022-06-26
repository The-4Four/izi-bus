import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:izi_bus/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  bool userIsAuthenticated = false;
  UserModel? _user;
  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      userIsAuthenticated = true;

      Navigator.pushReplacementNamed(context, "/", arguments: user);
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
      final foundUser = instance.getString("user") as String;
      setUser(context, UserModel.fromJson(foundUser));
      return;
    }

    setUser(context, null);
    return;
  }

  Future<void> handleSignOut(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final instance = await SharedPreferences.getInstance();

    googleSignIn.disconnect();
    instance.remove("user");

    Navigator.pushReplacementNamed(context, "/login");
  }
}
