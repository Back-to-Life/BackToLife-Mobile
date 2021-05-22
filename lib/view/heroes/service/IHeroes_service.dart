import 'package:backtolife/view/heroes/model/heroes_model.dart';
import 'package:dio/dio.dart';

abstract class IHeroesService {
  final Dio dio;
  final String path = 'sort';

  IHeroesService(this.dio);

  Future<HeroesModel?> fetchUserControl();
}
