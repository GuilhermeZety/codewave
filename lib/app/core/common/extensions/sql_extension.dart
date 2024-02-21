import 'package:landing_page/app/core/common/extensions/bool_extension.dart';

extension SqlMap on Map<String, dynamic> {
  Map<String, dynamic> toSqlMap() {
    return map<String, dynamic>((key, value) {
      if (value is bool) {
        return MapEntry(key, value.toNumber());
      }
      return MapEntry(key, value);
    });
  }
}

extension SqlMapList on List<Map<String, dynamic>> {
  List<Map<String, dynamic>> toSqlMapList() {
    return map<Map<String, dynamic>>((e) => e.toSqlMap()).toList();
  }
}

extension ThenSqlMapList on Future<List<Map<String, dynamic>>> {
  Future<List<Map<String, dynamic>>> thenSqlMapList() async {
    return (await this).toSqlMapList();
  }
}
