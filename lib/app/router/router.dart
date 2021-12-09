import 'package:auto_route/auto_route.dart';

import 'package:mobtech/ui/views/home/home_view.dart';
import 'package:mobtech/ui/views/signup/signup_view.dart';
import 'package:mobtech/ui/views/startup/startup_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: SignupView)
  ],
)
class $MobtechRouter {}