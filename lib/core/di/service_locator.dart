import 'package:get_it/get_it.dart';
import 'package:wasla/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:wasla/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:wasla/features/auth/domain/repositories/auth_repository.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:wasla/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:wasla/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:wasla/features/checkout/presentation/view_models/payment_view_model.dart';
import 'package:wasla/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:wasla/features/location/data/repository_impl/location_repository_impl.dart';
import 'package:wasla/features/location/domain/repositories/location_repository.dart';
import 'package:wasla/features/location/domain/use_cases/get_current_location_use_case.dart';
import 'package:wasla/features/location/presentation/view_models/location_view_model.dart';
import 'package:wasla/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:wasla/features/onboarding/data/repositories_impl/onboarding_repository_impl.dart';
import 'package:wasla/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:wasla/features/onboarding/domain/use_cases.dart/get_onboarding_data_use_case.dart';
import 'package:wasla/features/onboarding/presentation/view_models/onboarding_view_model.dart';
import 'package:wasla/features/pharmacies/data/data_sources/pharmacy_remote_data_source.dart';
import 'package:wasla/features/pharmacies/data/repositories_impl/pharmacy_repository_impl.dart';
import 'package:wasla/features/pharmacies/domain/repositories/pharmacy_repository.dart';
import 'package:wasla/features/pharmacies/domain/use_cases/fetch_productsBy_pharmacyId_use_case.dart';
import 'package:wasla/features/pharmacies/domain/use_cases/get_all_pharmacies_use_case.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';
import 'package:wasla/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:wasla/features/products/data/repositories_impl/product_repository_impl.dart';
import 'package:wasla/features/products/domain/repositories/product_repository.dart';
import 'package:wasla/features/products/domain/use_cases/get_all_products_use_case.dart';
import 'package:wasla/features/products/presentation/view_models/product_view_model.dart';
import 'package:wasla/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:wasla/features/profile/data/repositories_impl/profile_repository_impl.dart';
import 'package:wasla/features/profile/domain/repositories/profile_repository.dart';
import 'package:wasla/features/profile/domain/use_cases/get_user_info_use_case.dart';
import 'package:wasla/features/profile/presentation/view_models/profile_view_model.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton(() => OnboardingLocalDataSource());
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetOnboardingDataUseCase(sl()));
  sl.registerLazySingleton(() => AuthRemoteDataSource());
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => SignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl()));

  sl.registerLazySingleton(() => ProfileRemoteDataSource());
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetUserInfoUseCase(repository: sl()));

  sl.registerLazySingleton(() => ProductRemoteDataSource());
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetAllProductsUseCase(repository: sl()));
  sl.registerLazySingleton(() => PharmacyRemoteDataSource());
  sl.registerLazySingleton<PharmacyRepository>(
    () => PharmacyRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(
    () => FetchProductsbyPharmacyidUseCase(repository: sl()),
  );
  sl.registerLazySingleton(() => GetAllPharmaciesUseCase(repository: sl()));

  sl.registerLazySingleton(() => LocationRemoteDataSource());
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(locationRemoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => GetCurrentLocationUseCase(repository: sl()));

  sl.registerFactory(
    () => PharmacyViewModel(
      getAllPharmaciesUseCase: sl(),
      fetchProductsbyPharmacyidUseCase: sl(),
    ),
  );
  sl.registerFactory(() => LocationViewModel(getCurrentLocationUseCase: sl()));

  sl.registerFactory(
    () => AuthViewModel(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      signOutUseCase: sl(),
    ),
  );
  sl.registerFactory(() => OnboardingViewModel(getOnboardingDataUseCase: sl()));
  sl.registerFactory(() => ProfileViewModel(getUserInfoUseCase: sl()));
  sl.registerFactory(() => ProductViewModel(getAllProductsUseCase: sl()));

  sl.registerFactory(() => PaymentViewModel());
}
