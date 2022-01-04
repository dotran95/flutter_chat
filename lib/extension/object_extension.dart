extension ObjectX on Object {
  valueForKey<T>(String key) {
    if (this is Map) {
      final mapObj = this as Map;
      if (mapObj.containsKey(key)) {
        return mapObj[key] as T;
      }
    }
    return null;
  }
}