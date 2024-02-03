import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';

class FindPatientPage extends StatelessWidget {

  const FindPatientPage({ super.key });

   @override
   Widget build(BuildContext context) {
    Injector.get<SelfServiceController>().debug;
       return Scaffold(
           appBar: AppBar(title: const Text('Procurar Paciente'),),
           body: Container(),
       );
  }
}