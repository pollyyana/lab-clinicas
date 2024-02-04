import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/widget/lab_clinicas_self_service_app_bar.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: LabClinicasTheme.orangeColor)),
            child: Column(
              children: [
                Image.asset('assets/images/check_icon.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text('Cadastro encontrado',
                    style: LabClinicasTheme.titleSmallStyle),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Confirma os dados do seu cadastro ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: LabClinicasTheme.blueColor),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text('Nome Paciente')),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Email')),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text('Telefone de contato')),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text('Digite seu CPF')),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text('CEP')),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Endereço')),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Número')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Complemento')),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Estado')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Cidade')),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Bairro')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Responsável')),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text('Responsável Identificação')),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                          child: OutlinedButton(
                              onPressed: () {}, child: const Text('EDITAR'))),
                    ),
                    const SizedBox(
                       width: 17,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('CONTINUAR'),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
