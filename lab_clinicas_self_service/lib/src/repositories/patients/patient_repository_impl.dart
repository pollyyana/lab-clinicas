import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import 'package:lab_clinicas_self_service/src/model/patient_model.dart';

import './patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  final RestClient restClient;
  PatientRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocumet(
      String document) async {
    try {
      final Response(:List data) = await restClient.auth.get('/patients', queryParameters: {'document': document});

      if (data.isEmpty) {
        return Right(null);
      }

     return Right(PatientModel.fromJson(data.first));

    } on DioException catch (e, s) {
      log('Erro ao buscar paciente por cpf', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}