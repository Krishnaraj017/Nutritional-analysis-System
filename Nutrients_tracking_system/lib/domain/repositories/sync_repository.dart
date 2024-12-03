abstract class SyncRepository {
  Future<bool> syncAll();

  Future<void> getLast7DaysData();
}
