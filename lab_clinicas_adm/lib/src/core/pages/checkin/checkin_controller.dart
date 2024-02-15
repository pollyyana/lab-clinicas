
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../models/patients_information_form_model.dart';

class CheckinController with MessageStateMixin {
    final informationForm = signal<PatientInformationFormModel?>(null);

}