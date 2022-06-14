import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:izi_bus/shared/auth/auth_controller.dart';
import 'package:izi_bus/shared/models/user_model.dart';

class LoginPageController {
  final authController = AuthController();

  Future<void> googleSigIn(BuildContext context) async {
    GoogleSignIn signIn = GoogleSignIn(scopes: ['email']);

    try {
      final response = await signIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoUrl: response.photoUrl);
      authController.setUser(context, user);

      print(response);
    } catch (error) {
      print(error);
    }
  }
}
