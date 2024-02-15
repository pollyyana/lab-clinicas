
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/core/pages/pre_checkin/pre_checkin_controller.dart';
import 'package:lab_clinicas_adm/src/core/pages/pre_checkin/pre_checkin_page.dart';
import 'package:lab_clinicas_adm/src/models/patients_information_form_model.dart';

class PreCheckinRouter extends FlutterGetItPageRouter {
  const PreCheckinRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => PreCheckinController(callNestPatientService: i()),
        ),
      ];

  @override
  String get routeName => '/pre-checkin';

  @override
  WidgetBuilder get view => (context) {
        final form = ModalRoute.of(context)!.settings.arguments
            as PatientInformationFormModel;
        context.get<PreCheckinController>().informationForm.value = form;
        return const PreCheckinPage();
      };
}
