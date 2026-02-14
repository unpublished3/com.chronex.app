import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class CharacteristicData {
  final Guid uuid;
  final List<int> value;

  CharacteristicData({required this.uuid, required this.value});
}
