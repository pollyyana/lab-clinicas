import 'package:flutter/material.dart';
import 'package:lab_clinicas_adm/src/shared/data_item.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const Text(
                    'Ponto polly',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                const DataItem(
                  label: 'Nome paciente',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Email',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Telefone de contato',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'CPF',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'CEP',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Endereço',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Responsavel',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
                ),
                const DataItem(
                  label: 'Documento de Identificaçao',
                  value: 'Ponto polly',
                  padding: EdgeInsets.only(bottom: 24),
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
                        onPressed: () {},
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
                          onPressed: () {},
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
