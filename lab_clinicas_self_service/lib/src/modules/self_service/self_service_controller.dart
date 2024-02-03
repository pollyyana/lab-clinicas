
//? Etapas do formulario
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

///none = nenhum
///done = feito
enum FormSteps{
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart

}

class SelfServiceController with MessageStateMixin{
  //se inicia em lugar nenhum
  final _step = ValueSignal(FormSteps.none);


  FormSteps get step => _step();

  void startProcess(){
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void goPatient(){
    _step.forceUpdate(FormSteps.patient);
  }
}