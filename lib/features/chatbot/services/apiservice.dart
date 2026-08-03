import 'package:camera/camera.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  final String url =
      "https://lamenna2006.app.n8n.cloud/webhook-test/nutrisnap";

  /// إرسال رسالة نصية
  Future<String> sendMessage(
      String message,
      String sessionId,
      ) async {
    try {
      Response response = await dio.post(
        url,
        data: {
          "message": message,
          "session_id": sessionId,
        },
      );

      print("========== SEND MESSAGE ==========");
      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");

      return response.data["reply"].toString();
    } on DioException catch (e) {
      print("========== ERROR ==========");
      print("Status Code: ${e.response?.statusCode}");
      print("Response: ${e.response?.data}");
      print("Message: ${e.message}");

      throw Exception(e.toString());
    }
  }

  /// إرسال صورة
  Future<String> sendImage(
      XFile image,
      String sessionId,
      ) async {

    try {

      FormData formData = FormData.fromMap({

        "session_id": sessionId,

        "image": await MultipartFile.fromFile(
          image.path,
          filename: image.name,
        ),

      });


      Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          contentType: "multipart/form-data",
        ),
      );

      print("========== SEND IMAGE ==========");
      print("Status Code: ${response.statusCode}");
      print("Response: ${response.data}");

      return response.data["reply"].toString();


    } on DioException catch(e){

      print(e.response?.data);

      throw Exception(
          e.response?.data.toString()
      );

    }
  }
}