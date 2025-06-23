import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.email,
    required this.userName,
    required this.profilePicture,
    required this.id,
  });
  final String id;
  final String email;
  final String userName;
  String profilePicture;
  //Function To Get Formatted Phone Number
  static List<String> nameparts(fullName) => fullName.split(" ");
  //Genrate a username from full name
  static String generateUserName(fullName) {
    List<String> nameparts = fullName.split(" ");
    String firstName = nameparts[0].toLowerCase();
    String lastName = nameparts.length > 1 ? nameparts[1].toLowerCase() : "";
    String camelCaseName = "$firstName$lastName";
    String userNameWithPerfix = "user_$camelCaseName";
    return userNameWithPerfix;
  }

  static UserModel empty() => UserModel(
        id: "",
        email: "",
        userName: "",
        profilePicture: "",
      );

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromSnapShot(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      _$UserModelFromSnapShot(document);
}