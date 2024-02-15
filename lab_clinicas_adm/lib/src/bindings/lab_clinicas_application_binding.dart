import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/core/env.dart';
import 'package:lab_clinicas_adm/src/core/pages/services/call_next_patient/call_next_patient_service.dart';
import 'package:lab_clinicas_adm/src/repositories/attendant_desk_assingment/attendant_desk_assignment_repository_impl.dart';
import 'package:lab_clinicas_adm/src/repositories/attendant_desk_assingment/attendant_desk_assingment_repository.dart';
import 'package:lab_clinicas_adm/src/repositories/painel/painel_repository.dart';
import 'package:lab_clinicas_adm/src/repositories/painel/painel_repository_impl.dart';
import 'package:lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository_impl.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(Env.backendBaseUrl),
        ),
        Bind.lazySingleton<PatientInformationFormRepository>(
          (i) => PatientInformationFormRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton<AttendantDeskAssignmentRepository>(
          (i) => AttendantDeskAssignmentRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton<PainelRepository>(
          (i) => PainelRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton(
          (i) => CallNextPatientService(
            patientInformationFormRepository: i(),
            attendantDeskAssignmentRepository: i(),
            painelRepository: i(),
          ),
        ),
      ];
}
