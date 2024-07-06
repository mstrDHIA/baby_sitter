import 'package:babysitter_v1/main.dart';

class AppCache {
  AppCache();
  String _onboardedKey = "ONBOARDED_KEY";
  String _isCompleteProfile = "IS_COMPLETE_PROFILE";
  String _uid = "UID";
  String _isVerified = "VERIFIED";
  String _role = "ROLE";
  String _soin = "SOIN";
  String _besoin = "BESOIN";

  // ONBOARDED
  Future<void> setOnboarded(bool value) async =>
      await sharedPref!.setBool(_onboardedKey, value);
  bool getOnboarded() => sharedPref!.getBool(_onboardedKey) ?? false;
  // UID
  Future<void> setUid(String value) async =>
      await sharedPref!.setString(_uid, value);
  String getUid() => sharedPref!.getString(_uid) ?? "";

  // ISVERIFIED
  Future<void> setVerified(bool value) async =>
      await sharedPref!.setBool(_isVerified, value);
  bool getIsVerified() => sharedPref!.getBool(_isVerified) ?? false;

  // ROLE
  Future<void> setRole(String value) async =>
      await sharedPref!.setString(_role, value);
  String getRole() => sharedPref!.getString(_role) ?? "";

  // ISCOMPLETEPROFILE
  Future<void> setIsCompleteProfile(bool value) async =>
      await sharedPref!.setBool(_isCompleteProfile, value);
  bool getIsCompleteProfile() =>
      sharedPref!.getBool(_isCompleteProfile) ?? false;

  Future<void> clear() async {
    await sharedPref!.remove(_role);
    await sharedPref!.remove(_isVerified);
    await sharedPref!.remove(_uid);
    await sharedPref!.remove(_isCompleteProfile);
    await sharedPref!.remove(_soin);
  }

  ///Soin
  Future<void> setSoin(String value) async =>
      await sharedPref!.setString(_role, value);
  String getSoin() => sharedPref!.getString(_soin) ?? "";

  ///besoin
  Future<void> setBesoin(String value) async =>
      await sharedPref!.setString(_besoin, value);
  String getBesoin() => sharedPref!.getString(_besoin) ?? "";
}
