import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_panel/src/pages/painel/widgets/painel_principal_widget.dart';

class PainelPage extends StatelessWidget {
  const PainelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body:  SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
             height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width *.4,
                child: const PainelPrincipalWidget(
                  passwordLabel: 'Senha Anterior',
                  password: 'BG5893',
                  deskNumber: ' 03',
                  labelColor: LabClinicasTheme.orangeColor,
                  buttonColor: LabClinicasTheme.blueColor,
                ),
              ),const SizedBox(
                 width: 20 ,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width *.3,
                child: const PainelPrincipalWidget(
                  passwordLabel: 'Chamando senha',
                  password: 'BG5893',
                  deskNumber: ' 03',
                  labelColor: LabClinicasTheme.blueColor,
                  buttonColor: LabClinicasTheme.orangeColor,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
