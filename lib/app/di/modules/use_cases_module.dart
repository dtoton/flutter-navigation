import 'package:get_it/get_it.dart';
import 'package:navigation/app/di/di.dart';
import 'package:navigation/features/article/domain/article_use_case.dart';
import 'package:navigation/features/article/domain/article_use_case_impl.dart';

/// A module that provides use cases for DI.
abstract class UseCasesModule {
  static void register(GetIt locator) {
    locator.registerLazySingleton<ArticleUseCase>(
      () => ArticleUseCaseImpl(inject()),
    );
  }
}
