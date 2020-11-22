import 'package:get_it/get_it.dart';
import 'package:uberAir/view_model/passenger_list_view_model.dart';

import 'api/airport_api_client.dart';
import 'view_model/airport_view_model.dart';

//Singleton
GetIt locator = GetIt.asNewInstance();
/* internetten veri çekerken veya dbden 
her seferinde yeni nesne oluşturmamak için yapıldı.*/
void setUpLocator() {
  // locator.registerLazySingleton(() => AirportRepository());
  locator.registerLazySingleton(() => AirportApiClient());
  locator.registerFactory(() => AirportViewModel());
  locator.registerFactory(() => ItemViewModel());

}
