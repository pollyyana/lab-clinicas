import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/widget/lab_clinicas_self_service_app_bar.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';
import 'package:brasil_fields/brasil_fields.dart';

class FindPatientPage extends StatefulWidget {
  const FindPatientPage({super.key});

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage>
    with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final documentEC = TextEditingController();
  final controller = Injector.get<FindPatientController>();

  @override
  void initState() {
    messageListener(controller);
    effect(() {
      final FindPatientController(:patient, :patientNotFound) = controller;

      if (patient != null || patientNotFound != null) {
        //selfieServiceController setando o dado do paciente e redirecionando
        Injector.get<SelfServiceController>().goToFormPatience(patient);
        // print('paciente : ${patient != null }');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LabClinicasSelfServiceAppBar(),
        body: LayoutBuilder(
          builder: (_, constrains) {
            var sizeOf = MediaQuery.sizeOf(context);
            return SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(minHeight: constrains.maxHeight),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_login.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    width: sizeOf.width * .8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo_vertical.png'),
                          const SizedBox(
                            height: 48,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Nao sabe o CPF do paciente',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: LabClinicasTheme.blueColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.continueWithoutDocument();
                                },
                                child: const Text(
                                  'Clique aqui',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: LabClinicasTheme.orangeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: documentEC,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter(),
                            ],
                            validator:
                                Validatorless.required('CPF obrigatorio'),
                            decoration: const InputDecoration(
                                label: Text('Digite seu CPF')),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: sizeOf.width * .8,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid =
                                    formKey.currentState?.validate() ?? false;
                                if (valid) {
                                  controller
                                      .findPatientByDocumet(documentEC.text);
                                }
                              },
                              child: const Text('CONTINUAR'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
