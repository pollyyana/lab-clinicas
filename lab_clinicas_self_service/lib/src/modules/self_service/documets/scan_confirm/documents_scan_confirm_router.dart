import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documets/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documets/scan_confirm/documents_scan_confirm_page.dart';

class DocumentsScanConfirmRouter extends FlutterGetItModulePageRouter {
  const DocumentsScanConfirmRouter({super.key});

  @override
  List<Bind<Object>> get bindings =>
      [Bind.lazySingleton((i) => DocumentsScanConfirmController)];

  // @override
  // String get routeName => throw UnimplementedError();

  @override
  WidgetBuilder get view => (_) => DocumentsScanConfirmPage();
}
