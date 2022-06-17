import 'package:dio/dio.dart';
import 'package:freezed_dog/dog_model.dart';

abstract class IdogRepository {
  Future<DogModel> getDog();
}

class dogRepository extends IdogRepository {
  Dio dio = Dio();
  final link = "https://dog.ceo/api/breeds/image/random";

  @override
  Future<DogModel> getDog() async {
    try {
      final response = await dio.get(link);
      return DogModel.fromJson(response.data);
    } catch (e) {
      throw ('somehing goes wrong ======================================================$e');
    }
  }
}
