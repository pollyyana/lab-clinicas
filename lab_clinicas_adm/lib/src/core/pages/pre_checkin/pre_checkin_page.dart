import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/core/pages/pre_checkin/pre_checkin_controller.dart';
import 'package:lab_clinicas_adm/src/models/patients_information_form_model.dart';
import 'package:lab_clinicas_adm/src/shared/data_item.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PreCheckinPage extends StatefulWidget {
  const PreCheckinPage({super.key});

  @override
  State<PreCheckinPage> createState() => _PreCheckinPageState();
}

class _PreCheckinPageState extends State<PreCheckinPage> with MessageViewMixin {
  final controller = Injector.get<PreCheckinController>();

  @override
  void initState() {
    messageListener(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PatientInformationFormModel(:password, :patient) =
        controller.informationForm.watch(context)!;

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.sizeOf(context).width * .5,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(top: 56),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/patient_avatar.png'),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'A senha chamada foi',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  width: 218,
                  decoration: BoxDecoration(
                      color: LabClinicasTheme.orangeColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    password,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
               
                DataItem(
                  label: 'Nome paciente',
                  value: patient.name,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Email',
                  value: patient.email,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Telefone de contato',
                  value: patient.phoneNumber,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'CPF',
                  value: patient.document,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'CEP',
                  value: patient.address.cep,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Endereço',
                  value:
                      '${patient.address.streetAddress}, ${patient.address.number} '
                      '${patient.address.addressComplement}, ${patient.address.district}, '
                      '${patient.address.city} - ${patient.address.state} ',
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Responsavel',
                  value: patient.guardian,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(
                  label: 'Documento de Identificaçao',
                  value: patient.guardianIdentificationNumber,
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            fixedSize: const Size.fromHeight(48)),
                        onPressed: () {
                          controller.next();
                        },
                        child: const Text('CHAMAR OUTRA SENHA'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size.fromHeight(48)),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                                '/checkin',
                                arguments: controller.informationForm.value);
                          },
                          child: const Text('ATENDER')),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
