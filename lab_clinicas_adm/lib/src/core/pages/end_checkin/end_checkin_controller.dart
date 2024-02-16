import 'package:lab_clinicas_adm/src/models/patients_information_form_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import 'package:lab_clinicas_adm/src/core/pages/services/call_next_patient/call_next_patient_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckinController with MessageStateMixin {

  EndCheckinController({
    required CallNextPatientService callNextPatientService,
  }) : _callNextPatientService = callNextPatientService;

  CallNextPatientService _callNextPatientService;
  
  final informationForm = signal<PatientInformationFormModel?>(null);

  Future<void> callNextPatient()async{
    final result = await _callNextPatientService.execute();
    switch(result){
      case Left():
      showError('Erro ao chamar o proximo paciente');
      case Right(value: final form?):
      informationForm.value = form;
      case _:
      showInfo('Nenhum paciente aguardando, pode ir tomar café');
    }
  }
}
