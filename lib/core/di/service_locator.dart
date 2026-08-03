// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import '../../features/chatbot/services/apiservice.dart';
// import '../../features/home/data/models/recepieservice.dart';

// final getIt = GetIt.instance;

// void setupServiceLocator() {
//   // Dio client instance
//   getIt.registerLazySingleton<Dio>(() => Dio(
//         BaseOptions(
//           connectTimeout: const Duration(seconds: 15),
//           receiveTimeout: const Duration(seconds: 15),
//           contentType: 'application/json',
//         ),
//       ));

//   // Services
//   getIt.registerLazySingleton<N8nApiService>(
//     () => N8nApiService(dio: getIt<Dio>()),
//   );

//   getIt.registerLazySingleton<SpoonacularService>(
//     () => SpoonacularService(getIt<Dio>()),
//   );
// }
