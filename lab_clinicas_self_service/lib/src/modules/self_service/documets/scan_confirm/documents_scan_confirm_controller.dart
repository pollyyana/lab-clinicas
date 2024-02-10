
import 'package:flutter/foundation.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class DocumentsScanConfirmController with MessageStateMixin {

  final pathRemoteStorage = signal<String?>(null);


  Future<void> uploadImage(Uint8List imageBytes, String fileName)async{
    
  }
  
}