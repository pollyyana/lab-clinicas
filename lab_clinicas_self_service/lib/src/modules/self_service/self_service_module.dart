import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documets/documents_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documets/scan/documents_scan_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documets/scan_confirm/documents_scan_confirm_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/quem_sou_eu/who_i_am_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_page.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings =>
      [Bind.lazySingleton((i) => SelfServiceController())];

  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SelfServicePage(),
        '/whoIAm': (context) => const WhoIAmPage(),
        '/find-patient': (context) => const FindPatientPage(),
        '/patient': (context) => const PatientPage(),
        '/documents': (context) => const DocumentsPage(),
        '/documents/scan': (context) => const DocumentsScanPage(),
        '/documents/scan/confirm': (context) =>
            const DocumentsScanConfirmPage(),
        '/done': (context) => const DonePage(),
      };
}
