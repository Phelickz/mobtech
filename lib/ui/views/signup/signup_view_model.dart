import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobtech/app/core/custom_base_view_model.dart';
import 'package:mobtech/app/locator/locator.dart';
import 'package:mobtech/app/models/user.dart';
import 'package:mobtech/app/router/router.dart';
import 'package:mobtech/app/services/db.dart';
import 'package:mobtech/app/services/router_service.dart';
import 'package:mobtech/app/utils/theme.dart';
import 'package:one_context/one_context.dart';

class SignupViewModel extends CustomBaseViewModel {

  final router = locator<RouterService>();
  Future<void> init() async {}

  DateTime? _dateTime = DateTime.now();

  DateTime? get dateTime => _dateTime;

  XFile? _image;
  XFile? get image => _image;
  final ImagePicker _picker = ImagePicker();

  void getDateTime(DateTime newDate) {
    _dateTime = newDate;
    notifyListeners();
  }

  Future<void> getImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      _image = photo;
      notifyListeners();
    } else {
      XFile? file = await getLostData();

      if (file == null) {
      } else {
        _image = file;
        notifyListeners();
      }
    }
  }

  Future<XFile?> getLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return null;
    }
    if (response.files != null) {
      for (final XFile file in response.files!) {
        return file;
      }
    } else {
      return null;
    }
  }

  Future<void> saveToDatabase(User user) async {
    try {
      setBusy(true);
      print("Done000");

      User id = await UserProvider.database.insert(user);
      print("Done00");

      setBusy(false);
      OneContext.instance.showSnackBar(
        builder: (context) => SnackBar(
          backgroundColor: Colors.green[400],
          content: Text(
            "User data saved successfully",
            style: CustomThemeData.generateStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      );
      print("Done");
      router.router.push(HomeRoute());
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
