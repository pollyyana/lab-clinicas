//? Etapas do formulario
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

///none = nenhum
///done = feito
enum FormSteps { none, whoIAm, findPatient, patient, documents, done, restart }

class SelfServiceController with MessageStateMixin {
  //se inicia em lugar nenhum
  final _step = ValueSignal(
    FormSteps.none,
  );
  
  var _model = const SelfServiceModel();

  SelfServiceModel get model => _model;
  FormSteps get step => _step();

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void setWhoIAmDataStepAndNext(String name, String lastName) {
    _model = _model.copyWith(name: () => name, lastName: () => lastName);
    _step.forceUpdate(FormSteps.findPatient);
  }
  // void debug (){
  //   print(_model.name);
  //   print(_model.lastName);
  // }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatience(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormSteps.patient);
  }

  void restartProcess() {
    _step.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void updatePatientAndGoDocuments(PatientModel? patient) {
    _model =_model.copyWith(patient: ()=> patient);
    _step.forceUpdate(FormSteps.documents);
  }
}
