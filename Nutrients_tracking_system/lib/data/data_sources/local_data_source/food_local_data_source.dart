import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class FoodLocalDataSource {
}

@LazySingleton(as: FoodLocalDataSource)
class FoodLocalDataSourceImp extends FoodLocalDataSource {
  final Isar _isar = Isar.getInstance()!;
  
 

 
}
