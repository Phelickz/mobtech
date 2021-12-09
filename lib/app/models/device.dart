import 'dart:convert';

class DeviceInfo {
  final String? platformVersion;
  final String? imeiNo;
  final String? modelName;
  final String? manufacturer;
  final String? deviceName;
  final String? productName;
  final String? latitude;
  final String? longitude;
  DeviceInfo({
    this.platformVersion,
    this.imeiNo,
    this.modelName,
    this.manufacturer,
    this.deviceName,
    this.productName,
    this.latitude,
    this.longitude,
  });

  DeviceInfo copyWith({
    String? platformVersion,
    String? imeiNo,
    String? modelName,
    String? manufacturer,
    String? deviceName,
    String? productName,
    String? latitude,
    String? longitude,
  }) {
    return DeviceInfo(
      platformVersion: platformVersion ?? this.platformVersion,
      imeiNo: imeiNo ?? this.imeiNo,
      modelName: modelName ?? this.modelName,
      manufacturer: manufacturer ?? this.manufacturer,
      deviceName: deviceName ?? this.deviceName,
      productName: productName ?? this.productName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'platformVersion': platformVersion,
      'imeiNo': imeiNo,
      'modelName': modelName,
      'manufacturer': manufacturer,
      'deviceName': deviceName,
      'productName': productName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory DeviceInfo.fromMap(Map<String, dynamic> map) {
    return DeviceInfo(
      platformVersion: map['platformVersion'] != null ? map['platformVersion'] : null,
      imeiNo: map['imeiNo'] != null ? map['imeiNo'] : null,
      modelName: map['modelName'] != null ? map['modelName'] : null,
      manufacturer: map['manufacturer'] != null ? map['manufacturer'] : null,
      deviceName: map['deviceName'] != null ? map['deviceName'] : null,
      productName: map['productName'] != null ? map['productName'] : null,
      latitude: map['latitude'] != null ? map['latitude'] : null,
      longitude: map['longitude'] != null ? map['longitude'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceInfo.fromJson(String source) => DeviceInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DeviceInfo(platformVersion: $platformVersion, imeiNo: $imeiNo, modelName: $modelName, manufacturer: $manufacturer, deviceName: $deviceName, productName: $productName, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DeviceInfo &&
      other.platformVersion == platformVersion &&
      other.imeiNo == imeiNo &&
      other.modelName == modelName &&
      other.manufacturer == manufacturer &&
      other.deviceName == deviceName &&
      other.productName == productName &&
      other.latitude == latitude &&
      other.longitude == longitude;
  }

  @override
  int get hashCode {
    return platformVersion.hashCode ^
      imeiNo.hashCode ^
      modelName.hashCode ^
      manufacturer.hashCode ^
      deviceName.hashCode ^
      productName.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;
  }

  factory DeviceInfo.getDetails() {
    return DeviceInfo();
  }
}
