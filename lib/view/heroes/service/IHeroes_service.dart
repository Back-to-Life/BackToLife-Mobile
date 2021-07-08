import 'package:dio/dio.dart';

import '../model/heroes_model.dart';

abstract class IHeroesService {
  final Dio dio;
  final String path = 'sort';

  IHeroesService(this.dio);

  Future<HeroesModel?> fetchUserControl();
}
