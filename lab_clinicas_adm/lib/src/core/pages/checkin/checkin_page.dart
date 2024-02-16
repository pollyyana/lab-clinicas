import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/core/pages/checkin/checkin_controller.dart';
import 'package:lab_clinicas_adm/src/core/pages/checkin/widget/checkin_image_link.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../models/patients_information_form_model.dart';
import '../../../shared/data_item.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> with MessageViewMixin {
  final controller = Injector.get<CheckinController>();

  @override
  void initState() {
    messageListener(controller);
    effect(() {
      if (controller.endProcess()) {
        Navigator.of(context).pushReplacementNamed('/end-checkin');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PatientInformationFormModel(
      :password,
      :patient,
      :medicalOrders,
      :healthInsuranceCard
    ) = controller.informationForm.watch(context)!;

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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: LabClinicasTheme.lightOrangeColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'Cadastro',
                    style: LabClinicasTheme.subtitleSmallStyle.copyWith(
                        color: LabClinicasTheme.orangeColor,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 24,
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
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: LabClinicasTheme.lightOrangeColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'Validar Imagens Exames',
                    style: LabClinicasTheme.subtitleSmallStyle.copyWith(
                        color: LabClinicasTheme.orangeColor,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CheckinImageLink(
                      label: 'Carterinha',
                      image: healthInsuranceCard,
                    ),
                    Column(
                      children: [
                        for(final (index, medicalOrders) in medicalOrders.indexed)
                          CheckinImageLink(label: 'Pedido medico ${index +1}', image: medicalOrders,),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.endProcess();
                        // Navigator.of(context).pushReplacementNamed('/checkin',
                        //     arguments: controller.informationForm);
                      },
                      child: const Text('AFINALIZAR ATENDIMENTO')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
