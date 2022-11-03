import 'package:json_annotation/json_annotation.dart';
part 'user_info_model.g.dart';

@JsonSerializable()
class UserData {
  int? id;
  String? name;
  String? username;
  String? email;
  AddressData? address;
  String? phone;
  String? website;
  CompanyData? company;

  UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  sort(Function(dynamic a, dynamic b) param0) {}
}

@JsonSerializable()
class AddressData {
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  AddressData({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}

@JsonSerializable()
class CompanyData {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyData({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDataToJson(this);
}
