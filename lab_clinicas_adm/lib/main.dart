import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/bindings/lab_clinicas_application_binding.dart';
import 'package:lab_clinicas_adm/src/core/pages/login/login_router.dart';
import 'package:lab_clinicas_adm/src/core/pages/splash_page/splash_page.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const LabClinicasAdm());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    // throw error;
  });
}

class LabClinicasAdm extends StatelessWidget {
  const LabClinicasAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinics ADM',
      binding: LabClinicasApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
        FlutterGetItPageBuilder(page: (_) => const Text('estou na home'), path: '/home'),
      ],
      pages: const [LoginRouter()],
    );
  }
}
