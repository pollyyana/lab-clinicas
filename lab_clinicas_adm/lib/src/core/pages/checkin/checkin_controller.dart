import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:lab_clinicas_adm/src/models/patients_information_form_model.dart';

import '../../../repositories/patient_information_form/patient_information_form_repository.dart';

class CheckinController with MessageStateMixin {
  CheckinController({
    required PatientInformationFormRepository patientInformationFormRepository,
  }) : _patientInformationFormRepository = patientInformationFormRepository;

  final informationForm = signal<PatientInformationFormModel?>(null);
  final PatientInformationFormRepository _patientInformationFormRepository;
  final endProcess = signal(false);

  Future<void> endCheckin() async {
    if (informationForm() != null) {
      final result = await _patientInformationFormRepository.updateStatus(
          informationForm.value!.id,
          PatientInformationFormStatus.beingAttended);

          switch(result){
            case Left():
            showError('Erro ao atualizar o status do formulario');
            case Right():
            endProcess.value = true;
          }
    } else {
      showError('Formulario nao pode ser nulo');
    }
  }
}
