import 'dart:collection';

class LruCache<K, V> {
  final LinkedHashMap<K, V> _map;
  int _size = 0;
  int _maxSize;
  int _putCount = 0;
  int _createCount = 0;
  int _evictionCount = 0;
  int _hitCount = 0;
  int _missCount = 0;

  LruCache(int maxSize)
      : assert(maxSize > 0, 'maxSize <= 0'),
        _maxSize = maxSize,
        _map = LinkedHashMap<K, V>();

  void resize(int maxSize) {
    assert(maxSize > 0, 'maxSize <= 0');
    _maxSize = maxSize;
    _trimToSize(maxSize);
  }


  V? get(K key) {
    assert(key != null, 'key == null');
    V? mapValue;

    mapValue = _map[key];
    if (mapValue != null) {
      _hitCount++;
      return mapValue;
    }
    _missCount++;

    final V? createdValue = create(key);
    if (createdValue == null) {
      return null;
    }

    _createCount++;
    mapValue = _map.putIfAbsent(key, () => createdValue);
    if (mapValue != null) {
      _map[key] = mapValue;
    } else {
      _size += safeSizeOf(key, createdValue);
    }

    if (mapValue != null) {
      entryRemoved(false, key, createdValue, mapValue);
      return mapValue;
    } else {
      _trimToSize(_maxSize);
      return createdValue;
    }
  }

  V? put(K key, V value) {
    assert(key != null && value != null, 'key == null || value == null');
    V? previous;

    _putCount++;
    _size += safeSizeOf(key, value);
    previous = _map[key];
    if (previous != null) {
      _size -= safeSizeOf(key, previous);
    }
    _map[key] = value;

    if (previous != null) {
      entryRemoved(false, key, previous, value);
    }
    _trimToSize(_maxSize);
    return previous;
  }

  void _trimToSize(int maxSize) {
    while (true) {
      K key;
      V value;

      if (_size < 0 || (_map.isEmpty && _size != 0)) {
        throw StateError(
          '$runtimeType.sizeOf() is reporting inconsistent results!',
        );
      }

      if (_size <= maxSize) {
        break;
      }

      final toEvict = _eldest();
      if (toEvict == null) {
        break;
      }

      key = toEvict.key;
      value = toEvict.value;
      _map.remove(key);
      _size -= safeSizeOf(key, value);
      _evictionCount++;
      entryRemoved(true, key, value, null);
    }
  }

  MapEntry<K, V>? _eldest() {
    return _map.entries.firstOrNull;
  }

  V? remove(K key) {
    assert(key != null, 'key == null');
    V? previous;

    previous = _map.remove(key);
    if (previous != null) {
      _size -= safeSizeOf(key, previous);
      entryRemoved(false, key, previous, null);
    }
    return previous;
  }


  void entryRemoved(bool evicted, K key, V oldValue, V? newValue) {}


  V? create(K key) {
    return null;
  }


  int safeSizeOf(K key, V value) {
    final int result = sizeOf(key, value);
    if (result < 0) {
      throw StateError('Negative size: $key=$value');
    }
    return result;
  }

  int sizeOf(K key, V value) {
    return 1;
  }

  void evictAll() {
    _trimToSize(-1); // -1 will evict 0-sized elements
  }


  int size() => _size;

  /// Returns the maximum size of the cache.
  int maxSize() => _maxSize;

  /// Returns the number of cache hits.
  int hitCount() => _hitCount;

  /// Returns the number of cache misses.
  int missCount() => _missCount;

  /// Returns the number of entries created.
  int createCount() => _createCount;

  /// Returns the number of entries put into the cache.
  int putCount() => _putCount;

  /// Returns the number of entries evicted from the cache.
  int evictionCount() => _evictionCount;

  /// Returns a snapshot of the current cache.
  Map<K, V> snapshot() {
    return Map<K, V>.from(_map);
  }

  @override
  String toString() {
    final int accesses = _hitCount + _missCount;
    final int hitPercent = accesses != 0 ? (100 * _hitCount ~/ accesses) : 0;
    return 'LruCache[maxSize=$_maxSize,hits=$_hitCount,misses=$_missCount,'
        'hitRate=$hitPercent%]';
  }
}
