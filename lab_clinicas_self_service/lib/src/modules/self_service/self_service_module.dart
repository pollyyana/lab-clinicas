
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_page.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/self-service';

  @override
  
  Map<String, WidgetBuilder> get pages => {
    '/':(context) => const SelfServicePage()
  };
  
}