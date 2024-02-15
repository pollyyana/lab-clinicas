import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:lab_clinicas_adm/src/core/pages/services/call_next_patient/call_next_patient_service.dart';
import 'package:lab_clinicas_adm/src/models/patients_information_form_model.dart';
import 'package:lab_clinicas_adm/src/repositories/attendant_desk_assingment/attendant_desk_assingment_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HomeController with MessageStateMixin {
  HomeController({
    required AttendantDeskAssignmentRepository attendantDeskRepository,
    required CallNextPatientService callNextPatientService,
  })  : _attendantDeskRepository = attendantDeskRepository,
        _callNextPatientService = callNextPatientService;

  final AttendantDeskAssignmentRepository _attendantDeskRepository;
  final CallNextPatientService _callNextPatientService;

  final _informationForm = signal<PatientInformationFormModel?>(null);

  PatientInformationFormModel? get informationForm => _informationForm();

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result = await _attendantDeskRepository.startService(deskNumber);

    switch (result) {
      case Left():
        asyncstate.AsyncState.hide();
        showError('Erro ao iniciar Guichê');
      case Right():
        final resultNextPatient = await _callNextPatientService.execute();
        switch (resultNextPatient) {
          case Left():
            showError('Erro ao chamar o proximo paciente');
          case Right(value: final form?):
            asyncstate.AsyncState.hide();
            _informationForm.value = form;
            case Right(value: _):
            asyncstate.AsyncState.hide();
            showInfo('Nenhum paciente aguardando, pode ir tomar um cafezinho');
        }
    }
  }
}
      // case Right():
      //   asyncstate.AsyncState.hide();
        //chamar proximo paciente
        // showSuccess('Registrou com sucesso');