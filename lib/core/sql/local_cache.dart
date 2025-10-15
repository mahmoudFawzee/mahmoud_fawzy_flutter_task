abstract interface class LocalCacheHelper {
  ///this will store the data we want to cache for the first time
  ///
  ///this data can be any type it can be [String]
  ///
  ///then we will get the stored data
  ///
  ///[key] this key of the prefs
  ///[value] the value we want to store
  ///
  ///```dart
  ///Future<String>storeCache(key:'items',value:encodedStr);
  ///```
  Future<String> storeCache({required String key, required String value});

  ///this will update already stored data or we can say cached
  ///
  ///this data must be [String] encodedString
  ///
  ///[key] this key of the prefs
  ///[value] the value we want to store
  ///
  ///```dart
  ///Future<String>updateCached(key:'items',value:encodedStr);
  ///```
  Future<String> updateCached({required String key, required String value});

  ///this will get stored or cached data
  ///
  ///this data must be [String] encodedString
  ///
  ///[key] this key of the prefs
  ///
  ///```dart
  ///Future<String>getCached(key:'items');
  ///```
  Future<String> getCached(String key);
}
