import 'package:dio/dio.dart';
import 'package:posts/models/post_model.dart';
import 'package:posts/models/profile.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APICall {
  Dio dio = Dio();

  Future<List<PostModel>> getPosts() async {
    try {
      dio.interceptors.add(PrettyDioLogger());
      dio.options.headers['Accept'] = 'application/json';
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        List<PostModel> list = [];
        response.data!.forEach((element) {
          list.add(PostModel.fromJson(element));
        });
        return list;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<ProfileModel> getProfile(int id) async {
    try {
      dio.interceptors.add(PrettyDioLogger());
      dio.options.headers['Accept'] = 'application/json';
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/users/$id');
      if (response.statusCode == 200) {
        final data = ProfileModel.fromJson(response.data!);
        print(data);
        return data;
      }
    } catch (e) {
      print(e);
    }
    return ProfileModel();
  }
}
