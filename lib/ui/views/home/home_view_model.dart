import 'package:flutter/material.dart';
import 'package:mobtech/app/core/custom_base_view_model.dart';
import 'package:mobtech/app/models/user.dart';
import 'package:mobtech/app/services/db.dart';
import 'package:mobtech/app/utils/theme.dart';
import 'package:one_context/one_context.dart';

class HomeViewModel extends CustomBaseViewModel {
  Future<void> init() async {
    await getUsers();
  }

  List<User>? _users = [];

  List<User>? get users => _users;

  Future<void> getUsers() async {
    try {
      setBusy(true);
      _users = await UserProvider.database.getAllUsers();
      setBusy(false);
      notifyListeners();
    } catch (e) {
      setBusy(false);
      OneContext.instance.showSnackBar(
        builder: (context) => SnackBar(
          backgroundColor: Colors.red[400],
          content: Text(
            e.toString(),
            style: CustomThemeData.generateStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
}
