import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_panel/src/models/painel_checkin_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:intl/intl.dart';
import '../../core/env.dart';
import './painel_checkin_repository.dart';

class PainelCheckinRepositoryImpl implements PainelCheckinRepository {
  PainelCheckinRepositoryImpl({
    required this.restClient,
  });

  final RestClient restClient;

  @override
  ({WebSocketChannel channel, Function dispose}) openChannelSocket() {
    final channel = WebSocketChannel.connect(
        Uri.parse('${Env.wsBackendBaseUrl}?tables=painelCheckin'));

    return (
      channel: channel,
      dispose: () {
        channel.sink.close();
      }
    );
  }

  @override
  Stream<List<PainelCheckinModel>> getTodayPanel(
      WebSocketChannel channel) async* {
    yield await requestData();
    channel.stream.asyncMap((_) async => requestData());
    yield* channel.stream.asyncMap((_) async => requestData());
  }

  Future<List<PainelCheckinModel>> requestData() async {
    final dateFormat = DateFormat('y-MM-dd');
    final Response(:List data) = await restClient.auth.get('/painelCheckin',
        queryParameters: {'time_called': dateFormat.format(DateTime.now())});

    return data.reversed
        .take(7)
        .map((e) => PainelCheckinModel.fromJson(e))
        .toList();
  }
}
