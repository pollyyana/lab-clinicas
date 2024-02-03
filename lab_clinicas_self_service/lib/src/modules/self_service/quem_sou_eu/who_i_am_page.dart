import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final lastNameEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        nameEC.text = '';
        lastNameEC.text = '';
        selfServiceController.clearForm();
      },
      child: Scaffold(
          appBar: LabClinicasAppBar(
            actions: [
              PopupMenuButton(
                child: const IconPopupMenuWidget(),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Finalizar Terminal'),
                    ),
                  ];
                },
                onSelected: (value) async {
                  final nav = Navigator.of(context);
                  if (value == 1) {
                    await SharedPreferences.getInstance()
                        .then((sp) => sp.clear());
                    nav.pushNamedAndRemoveUntil('/', (route) => false);
                  }
                },
              ),
            ],
          ),
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
                            const Text(
                              'Bem vindo!!',
                              style: LabClinicasTheme.titleStyle,
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            TextFormField(
                              controller: nameEC,
                              validator:
                                  Validatorless.required('Nome obrigatório'),
                              decoration: const InputDecoration(
                                  label: Text('Digite seu nome')),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextFormField(
                              controller: lastNameEC,
                              validator: Validatorless.required(
                                  'sobrenome obrigatório'),
                              decoration: const InputDecoration(
                                  label: Text('Digite seu sobrenome')),
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
                                    selfServiceController
                                        .setWhoIAmDataStepAndNext(
                                      nameEC.text,
                                      lastNameEC.text,
                                    );
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
          )),
    );
  }
}
