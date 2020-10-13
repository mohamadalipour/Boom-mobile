import 'package:boom/character_list/bloc/character_bloc.dart';
import 'package:boom/character_list/bloc/charcter_list_bloc_impl.dart';
import 'package:boom/character_list/repository/characer_list_repository_impl.dart';
import 'package:boom/character_list/repository/movie_list_repository.dart';
import 'package:boom/data_source/api_client/api_client.dart';
import 'package:boom/data_source/api_client/api_client_impl.dart';
import 'package:boom/data_source/remote_data_source/remote_data_source.dart';
import 'package:boom/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.I;

setupServiceLocator() {
  getIt.registerSingleton<ApiClient>(
      ApiClientImpl());

  getIt.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl(
      apiClient: getIt.get<ApiClient>()));
  getIt.registerFactory<CharacterListRepository>(() =>
      CharacterListRepositoryImpl(
          remoteDataSource: getIt.get<RemoteDataSource>()));

  getIt.registerFactory<CharacterListBloc>(() =>
      CharacterListBlocImpl(
         characterListRepository: getIt.get<CharacterListRepository>()));
}
