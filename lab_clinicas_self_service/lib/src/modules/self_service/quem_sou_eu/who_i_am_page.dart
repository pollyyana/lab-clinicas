import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';

class WhoIAmPage extends StatelessWidget {
  const WhoIAmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quem sou eu'),
      ),
      body: Column(
        children: [
          Container(),
          ElevatedButton(
            onPressed: () {
              Injector.get<SelfServiceController>().goPatient();
            },
            child: const Text('Ir Paciente'),
          ),
        ],
      ),
    );
  }
}
