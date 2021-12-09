import "package:injectable/injectable.dart";
import "package:mobtech/app/router/router.dart";
    
@lazySingleton
class RouterService {
  final MobtechRouter router = MobtechRouter();
}