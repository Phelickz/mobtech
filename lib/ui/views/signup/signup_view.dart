import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:location/location.dart';
import 'package:mobtech/app/models/device.dart';
import 'package:mobtech/app/models/user.dart';
import 'package:mobtech/app/utils/constants.dart';
import 'package:mobtech/app/utils/res.dart';
import 'package:mobtech/app/utils/size.dart';
import 'package:mobtech/app/utils/theme.dart';
import 'package:mobtech/ui/widgets/dumb/button.dart';
import 'package:mobtech/ui/widgets/dumb/field.dart';
import 'package:mobtech/ui/widgets/dumb/skeleton.dart';
import 'package:mobtech/ui/widgets/smart/logo.dart';
import 'package:one_context/one_context.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';

import './signup_view_model.dart';

/// sign up page
class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  /// email controller of the signup form
  final email = TextEditingController();

  /// date controller of the signup form
  final dateController = TextEditingController();

  /// imei controller of the signup form
  final imei = TextEditingController();

  /// firstName controller of the signup form
  final firstName = TextEditingController();

  /// lastName controller of the signup form
  final lastName = TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// passportNumber controller of the signup form
  final passportNumber = TextEditingController();

  String imeiNos = '';

  DateTime? _date = DateTime.now();

  DeviceInfo? deviceInfo = DeviceInfo();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await getDeviceDetails();
      setState(() {
        dateController.text = _date.toString().substring(0, 10);
        imei.text = imeiNos;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      onModelReady: (SignupViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SignupViewModel model,
        Widget? child,
      ) {
        return Skeleton(
          backgroundColor: kWhite,
          isBusy: model.isBusy,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium(context),
                  // verticalSpaceSmall(context),
                  const Logo(
                    color: kBlue,
                    size: 38.0,
                  ),
                  verticalSpaceSmall(context),
                  Text(
                    "Let's get you started!",
                    style: GoogleFonts.dmSans(
                      fontSize: McGyver.textSize(context, 2.7),
                      color: kBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // verticalSpaceMedium(context),
                  verticalSpaceSmall(context),
                  SignupTextFields(
                    label: 'First Name',
                    controller: firstName,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                    },
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black45,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpaceSmall(context),
                  SignupTextFields(
                    label: 'Last Name',
                    controller: lastName,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                    },
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black45,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpaceSmall(context),
                  TextField(
                    controller: dateController,
                    style: CustomThemeData.generateStyle(
                        fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'DOB',
                      labelStyle: CustomThemeData.generateStyle(
                          fontSize: 17, color: Colors.black),
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black45, width: 0.5),
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlue, width: 2),
                      ),
                    ),
                    onTap: () async {
                      DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(Duration(days: 365000)),
                          lastDate: DateTime.now());
                      setState(() {
                        _date = dateTime;
                        dateController.text =
                            dateTime.toString().substring(0, 10);
                      });
                    },
                  ),
                  verticalSpaceSmall(context),
                  SignupTextFields(
                    label: 'Passport Number',
                    controller: passportNumber,
                    validator: (String? value) {
                      var calc = DateTime.now().difference(_date!);
                      if ((value == null || value.isEmpty) && calc.inDays >= 6570) {
                        return 'A passport number is required for age >= 18';
                      } else {
                        print('object');
                        print(value);
                        print(calc.inDays);
                        return null;
                      }
                    },
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black45,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpaceSmall(context),
                  SignupTextFields(
                    label: 'Email',
                    controller: email,
                    validator: (String? email) {
                      if (email != null && email.isNotEmpty) {
                        if (GetUtils.isEmail(email) == false) {
                          return 'Please enter a valid email address';
                        } else {
                          return null;
                        }
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black45,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  verticalSpaceSmall(context),
                  SignupTextFields(
                    label: 'Imei',
                    controller: imei,
                    password: false,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Icon(
                      Icons.security,
                      color: Colors.black45,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  verticalSpaceSmall(context),
                  model.image == null
                      ? SizedBox.shrink()
                      : Text(
                          model.image == null ? '' : model.image!.path,
                          style: CustomThemeData.generateStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                  verticalSpaceSmall(context),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: McGyver.rsDoubleW(context, 40),
                      child: CustomButtons.clearButton(
                          context: context,
                          onTap: () async {
                            await model.getImage();
                          },
                          text: 'Select image',
                          textColor: Colors.black),
                    ),
                  ),
                  verticalSpaceMedium(context),
                  CustomButtons.gradientButton(
                    context: context,
                    onTap: () async {
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        if (model.image != null) {
                          await Location().requestPermission();
                          LocationData loc = await (Location().getLocation());
                          var appDocDir = await getTemporaryDirectory();
                          print(deviceInfo!.latitude);
                          String savePath = appDocDir.path + "/image.jpg";
                          final result = await ImageGallerySaver.saveFile(
                              model.image!.path);
                          print(result);
                          print(savePath);
                          User user = User(
                            imei: deviceInfo!.imeiNo,
                            firstName: firstName.text,
                            lastName: lastName.text,
                            email: email.text,
                            dob: dateController.text,
                            passportNumber: passportNumber.text,
                            photoUrl: result['filePath'].toString(),
                            platformType:
                                deviceInfo!.platformVersion ?? "platform",
                            deviceName: deviceInfo!.deviceName ?? "Device name",
                            latitude: loc.latitude == null
                                ? "0.0"
                                : loc.latitude.toString(),
                            longitude: loc.latitude == null
                                ? "0.0"
                                : loc.latitude.toString(),
                          );

                          print(user.toJson());

                          model.saveToDatabase(user);
                        } else {
                          OneContext.instance.showSnackBar(
                            builder: (context) => SnackBar(
                              backgroundColor: Colors.black54,
                              content: Text(
                                "Select an image first",
                                style: CustomThemeData.generateStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    },
                    text: 'Save',
                  ),
                  verticalSpaceSmall(context),
                  verticalSpaceSmall(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> getDeviceDetails() async {
    try {
      String platformVersion = await DeviceInformation.platformVersion;
      String imeiNo = await DeviceInformation.deviceIMEINumber;
      String modelName = await DeviceInformation.deviceModel;
      String manufacturer = await DeviceInformation.deviceManufacturer;
      String deviceName = await DeviceInformation.deviceName;
      String productName = await DeviceInformation.productName;
      // LocationData loc = await Location().getLocation();
      setState(() {
        imeiNos = imeiNo;
        deviceInfo = DeviceInfo(
          platformVersion: platformVersion,
          imeiNo: imeiNo,
          modelName: modelName,
          manufacturer: manufacturer,
          deviceName: deviceName,
          productName: productName,
          // latitude: loc.latitude.toString(),
          // longitude: loc.longitude.toString(),
        );
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
