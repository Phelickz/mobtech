import 'dart:convert';

class User {
  /// id of the user
  int? id;

  /// imei of the user phone
  final String? imei;

  /// firstname of the user
  final String? firstName;

  ///lastname of the user
  final String? lastName;
  //date of birth of the user
  final String? dob;

  /// passport number of users above the age of 18
  final String? passportNumber;

  /// email of the users
  final String? email;

  /// photo Url of the user
  final String? photoUrl;

  /// the device name of the user
  final String? deviceName;

  /// the platform type of the user's device. (android or ios)
  final String? platformType;

  /// latitude location of the user
  final String? latitude;

  /// longitude location of the user
  final String? longitude;
  User({
    this.id,
    this.imei,
    this.firstName,
    this.lastName,
    this.dob,
    this.passportNumber,
    this.email,
    this.photoUrl,
    this.deviceName,
    this.platformType,
    this.latitude,
    this.longitude,
  });

  User copyWith({
    int? id,
    String? imei,
    String? firstName,
    String? lastName,
    String? dob,
    String? passportNumber,
    String? email,
    String? photoUrl,
    String? deviceName,
    String? platformType,
    String? latitude,
    String? longitude,
  }) {
    return User(
      id: id ?? this.id,
      imei: imei ?? this.imei,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      passportNumber: passportNumber ?? this.passportNumber,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      deviceName: deviceName ?? this.deviceName,
      platformType: platformType ?? this.platformType,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'imei': imei,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'passportNumber': passportNumber,
      'email': email,
      'photoUrl': photoUrl,
      'deviceName': deviceName,
      'platformType': platformType,
      'latitude': latitude,
      'longitude': longitude,
    };

    if (id != null) {
      map['_id'] = id;
    }

    return map;
  }

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      id: map['_id'] != null ? map['_id'] : null,
      imei: map['imei'] != null ? map['imei'] : null,
      firstName: map['firstName'] != null ? map['firstName'] : null,
      lastName: map['lastName'] != null ? map['lastName'] : null,
      dob: map['dob'] != null ? map['dob'] : null,
      passportNumber:
          map['passportNumber'] != null ? map['passportNumber'] : null,
      email: map['email'] != null ? map['email'] : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] : null,
      deviceName: map['deviceName'] != null ? map['deviceName'] : null,
      platformType: map['platformType'] != null ? map['platformType'] : null,
      latitude: map['latitude'] != null ? map['latitude'] : null,
      longitude: map['longitude'] != null ? map['longitude'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, imei: $imei, firstName: $firstName, lastName: $lastName, dob: $dob, passportNumber: $passportNumber, email: $email, photoUrl: $photoUrl, deviceName: $deviceName, platformType: $platformType, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.imei == imei &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.dob == dob &&
        other.passportNumber == passportNumber &&
        other.email == email &&
        other.photoUrl == photoUrl &&
        other.deviceName == deviceName &&
        other.platformType == platformType &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imei.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        dob.hashCode ^
        passportNumber.hashCode ^
        email.hashCode ^
        photoUrl.hashCode ^
        deviceName.hashCode ^
        platformType.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }

  @override
  List<String>? getVariables() => [
        '_id',
        'imei',
        'firstName',
        'lastName',
        'dob',
        'passportNumber',
        'email',
        'photoUrl',
        'deviceName',
        'platformType',
        'latitude',
        'longitude'
      ];
}
