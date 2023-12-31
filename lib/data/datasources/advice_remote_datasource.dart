import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/advice_model.dart';

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}


class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {

    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {
          'Content-Type': 'application/json',
        },
    );
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    } 
  } 
}