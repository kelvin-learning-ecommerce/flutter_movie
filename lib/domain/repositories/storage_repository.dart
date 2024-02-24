abstract class StorageRepository {
  Future<void> storeIsLogin(bool isLogin);

  Future<void> storeLoggedInUsername(String username);

  Future<String?> fetchLoggedInUsername();

  Future<bool> getIsLogin();
}
