
import 'package:lab_clinicas_adm/src/core/pages/services/call_next_patient/call_next_patient_service.dart';
import 'package:lab_clinicas_adm/src/models/patients_information_form_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PreCheckinController with MessageStateMixin {

  PreCheckinController({
    required CallNextPatientService callNestPatientService,
  }) : _callNestPatientService = callNestPatientService;

  final CallNextPatientService _callNestPatientService;

  final informationForm = signal<PatientInformationFormModel?>(null);


  Future<void> next() async{
    final result = await _callNestPatientService.execute();
    switch(result){
      case Left():
      showError('Erro ao chamar paciente ');
      case Right(value: final form?):
      informationForm.value = form;
      case Right():
      showInfo('Nenhum paciente aguardado, pode ir tomar um café');
    }
  }
}
