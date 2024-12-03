import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

enum BottomNavBarItem { home, water, health, meals, profile }

@injectable
class BottomNavBarCubit extends Cubit<BottomNavBarItem> {
  BottomNavBarCubit() : super(BottomNavBarItem.home);

  void updateSelectedItem(BottomNavBarItem selectedItem) {
    emit(selectedItem);
  }
}
