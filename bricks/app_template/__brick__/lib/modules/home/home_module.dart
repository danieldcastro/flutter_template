import 'package:flutter_modular/flutter_modular.dart';

import '../../core/di/core_module.dart';
import '../../core/routing/routes.dart';
import 'data/datasources/home_datasource_impl.dart';
import 'data/datasources/i_home_datasource.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/i_home_repository.dart';
import 'domain/usecases/get_posts_usecase.dart';
import 'ui/pages/home_page.dart';
import 'ui/state/home_bloc.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<IHomeDatasource>(HomeDatasourceImpl.new)
      ..addLazySingleton<IHomeRepository>(HomeRepositoryImpl.new)
      ..addLazySingleton(GetPostsUsecase.new)
      ..addLazySingleton<HomeBloc>(HomeBloc.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.initial, child: (_) => HomePage());
    super.routes(r);
  }
}
