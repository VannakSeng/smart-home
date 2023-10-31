import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _background =
          await secureStorage.getString('ff_background') ?? _background;
    });
    await _safeInitAsync(() async {
      _itmes = (await secureStorage.getStringList('ff_itmes'))
              ?.map((x) {
                try {
                  return ItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _itmes;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _background =
      'https://images.samsung.com/is/image/samsung/assets/uk/smartthings/do-the-smartthings/23-st01_home-kv-carousel_pc_1440x640.jpg?imwidth=2560';
  String get background => _background;
  set background(String _value) {
    _background = _value;
    secureStorage.setString('ff_background', _value);
  }

  void deleteBackground() {
    secureStorage.delete(key: 'ff_background');
  }

  List<ItemStruct> _itmes = [];
  List<ItemStruct> get itmes => _itmes;
  set itmes(List<ItemStruct> _value) {
    _itmes = _value;
    secureStorage.setStringList(
        'ff_itmes', _value.map((x) => x.serialize()).toList());
  }

  void deleteItmes() {
    secureStorage.delete(key: 'ff_itmes');
  }

  void addToItmes(ItemStruct _value) {
    _itmes.add(_value);
    secureStorage.setStringList(
        'ff_itmes', _itmes.map((x) => x.serialize()).toList());
  }

  void removeFromItmes(ItemStruct _value) {
    _itmes.remove(_value);
    secureStorage.setStringList(
        'ff_itmes', _itmes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromItmes(int _index) {
    _itmes.removeAt(_index);
    secureStorage.setStringList(
        'ff_itmes', _itmes.map((x) => x.serialize()).toList());
  }

  void updateItmesAtIndex(
    int _index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    _itmes[_index] = updateFn(_itmes[_index]);
    secureStorage.setStringList(
        'ff_itmes', _itmes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInItmes(int _index, ItemStruct _value) {
    _itmes.insert(_index, _value);
    secureStorage.setStringList(
        'ff_itmes', _itmes.map((x) => x.serialize()).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
