import 'package:flutter/material.dart';
import 'package:mobtech/app/locator/locator.dart';
import 'package:mobtech/app/router/router.dart';
import 'package:mobtech/app/services/router_service.dart';
import 'package:mobtech/app/utils/constants.dart';
import 'package:mobtech/app/utils/size.dart';
import 'package:mobtech/app/utils/theme.dart';
import 'package:mobtech/ui/widgets/dumb/skeleton.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Skeleton(
          backgroundColor: Colors.white,
          isBusy: model.isBusy,
          floatingActionButton: FloatingActionButton(
            backgroundColor: kBlue,
            onPressed: () {
              final router = locator<RouterService>();
              router.router.push(SignupRoute());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBlue,
            title: Text(
              "Customers",
              style: CustomThemeData.generateStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          body: model.isBusy
              ? SizedBox.shrink()
              : model.users!.isEmpty
                  ? Center(
                      child: Text('No customer data'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: model.users!.map((e) {
                          return Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text(
                                      "ID: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.id != null ? e.id!.toString() : '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "First Name: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.firstName ?? '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Last Name: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.lastName ?? '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Date of Birth: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.dob ?? '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Email: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.email ?? '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Passport Number: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.passportNumber ?? '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Device Name: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.deviceName ?? "",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Platform Type: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.platformType ?? '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Latitude: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.latitude ?? "",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Longitude: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      e.longitude ?? '',
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpaceXSmall(context),
                                Row(
                                  children: [
                                    Text(
                                      "Photo Url: ",
                                      style: CustomThemeData.generateStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.photoUrl ?? "",
                                        style: CustomThemeData.generateStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
        );
      },
    );
  }
}
