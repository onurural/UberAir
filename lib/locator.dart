import 'package:get_it/get_it.dart';
import 'package:uberAir/view_model/passenger_list_view_model.dart';
import 'package:uberAir/view_model/search_view_model.dart';
import 'api/api_client.dart';
import 'view_model/airport_view_model.dart';
import 'view_model/calendar_view_model.dart';
import 'widget/home_screen.dart';

//Singleton
GetIt locator = GetIt.asNewInstance();
/* internetten veri çekerken veya dbden 
her seferinde yeni nesne oluşturmamak için yapıldı.*/
void setUpLocator() {
  // locator.registerLazySingleton(() => AirportRepository());
  locator.registerLazySingleton(() => AirportApiClient());
  locator.registerFactory(() => AirportViewModel());
  locator.registerFactory(() => ItemViewModel());
  locator.registerLazySingleton(() => SearchViewModel());
  locator.registerLazySingleton(() => MyFlightInfoField());
  locator.registerFactory(() => CalendarViewModel());
}
