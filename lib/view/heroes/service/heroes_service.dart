import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import '../model/heroes_model.dart';
import 'IHeroes_service.dart';
import 'base_response_model/base_response_model.dart';

class HeroesService extends IHeroesService {
  HeroesService(Dio dio) : super(dio);

  List<HeroesModel> heroes = [];
  HeroesModel? heroesModel;

  @override
  Future<HeroesModel?> fetchUserControl() async {
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
            heroesModel = baseCharacterModel.data!;
            // heroes = baseCharacterModel.data ?? [];
          } else if (data is List) {
            heroes = data.map((e) => HeroesModel.fromJson(e)).toList();
          }
        }
        return heroesModel;
      } else {
        return null;
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }
}
