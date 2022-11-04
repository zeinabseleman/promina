import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';
import '../repository/auth_repo.dart';


class UserProvider extends ChangeNotifier {
  AuthRepo authRepo=AuthRepo();
  UserModel? userModel;


  login({required String email, required String password}) async {
    await authRepo.login(email , password).then((value) {
      userModel = value;
      notifyListeners();
    });
  }

}