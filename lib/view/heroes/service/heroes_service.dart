import 'dart:convert';
import 'dart:io';

import 'package:backtolife/view/heroes/model/heroes_model.dart';
import 'package:backtolife/view/heroes/service/IHeroes_service.dart';
import 'package:backtolife/view/heroes/service/base_response_model/base_response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

class HeroesService extends IHeroesService {
  HeroesService(Dio dio) : super(dio);
  List<HeroesModel> heroes = [];

  @override
  Future<List<HeroesModel>> fetchUserControl() async {
    try {
      final response = await dio.get('sort');
      if (response.statusCode == 200) {
        //print(response.data);
        // print(List.from(jsonDecode(response.data)[0]["data"]
        //    .map((e) => HeroesModel.fromJson(e))));
        // heroes = List.from(jsonDecode(response.data)[0]["data"].map((e) => HeroesModel.fromJson(e)));
        if (response.statusCode == HttpStatus.ok) {
          final data = response.data;
          if (data is Map<String, dynamic>) {
            final baseCharacterModel = BaseResponseHeroes.fromJson(data);
            heroes = baseCharacterModel.data ?? [];
          } else if (data is List) {
            heroes = data.map((e) => HeroesModel.fromJson(e)).toList();
          }
        }
        return heroes;
      } else {
        return [];
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
}
