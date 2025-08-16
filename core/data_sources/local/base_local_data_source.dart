import 'dart:io' as io;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../utils/constants.dart';
import 'shared_preferences_helper.dart';

abstract class BaseLocalDataSource {
  Future<String> get token;

  /// 0 English 1 Arabic
  int get language;

  // String get phone;

  /// 0 false  1 true
  // String get shuffle;

  /// 0 White  1 Dark
  // int get color;

  // String get smsToken;

  // Future<void> setAppColor(String value);

  Future<void> setAppLanguage(String value);

  // Future<void> setShuffle(String shuffle);

  Future<void> logout();

  Future<void> setToken(String token);

  // List<String> get searchHistory;

  // Future<void> setSearchHistory(String history);

  // Future<void> setSmsToken(String value);
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImp implements BaseLocalDataSource {
  // @override
  // int get color {
  //   return int.parse(
  //     SharedPreferencesHelper.getString(
  //       LocalStorageKeys.appColor,
  //       defaultValue: '1',
  //     ),
  //   );
  // }

  @override
  Future<void> logout() async {
    await SharedPreferencesHelper.clearAllSecuredData();
  }

  // @override
  // Future<void> setAppColor(String value) async {
  //   await SharedPreferencesHelper.setData(LocalStorageKeys.appColor, value);
  // }

  @override
  Future<void> setAppLanguage(String value) async {
    await SharedPreferencesHelper.setData(LocalStorageKeys.appLanguage, value);
  }

  @override
  Future<String> get token async {
    final String token = await SharedPreferencesHelper.getSecuredString(
      LocalStorageKeys.apiToken,
    );
    return token;
  }

  @override
  int get language {
    if (kIsWeb) {
      final String language = SharedPreferencesHelper.getString(
        LocalStorageKeys.appLanguage,
      );
      if (language.isEmpty) {
        final String systemLocales = ui
            .PlatformDispatcher
            .instance
            .locale
            .languageCode
            .substring(0, 2);
        final int systemLocalesAsInt = systemLocales == 'en' ? 0 : 1;
        setAppLanguage(systemLocalesAsInt.toString());
        return systemLocalesAsInt;
      } else {
        return int.parse(language);
      }
    } else {
      // else if isn't web
      final String language = SharedPreferencesHelper.getString(
        LocalStorageKeys.appLanguage,
      );
      if (language.isEmpty) {
        final String deviceLanguage = io.Platform.localeName.substring(0, 2);
        final int deviceLanguageAsInt = deviceLanguage == 'en' ? 0 : 1;
        setAppLanguage(deviceLanguageAsInt.toString());
        return deviceLanguageAsInt;
      } else {
        return int.parse(language);
      }
    }
  }

  @override
  Future<void> setToken(String token) {
    return SharedPreferencesHelper.setSecuredString(
      LocalStorageKeys.apiToken,
      token,
    );
  }

  // @override
  // String get phone {
  //   return SharedPreferencesHelper.getString(LocalStorageKeys.phoneNumber);
  // }

  // @override
  // String get shuffle {
  //   return SharedPreferencesHelper.getString(LocalStorageKeys.shuffle,
  //       defaultValue: '0');
  // }

  // @override
  // Future<void> setShuffle(String shuffle) async {
  //   await SharedPreferencesHelper.setData(LocalStorageKeys.shuffle, shuffle);
  // }

  // @override
  // List<String> get searchHistory {
  //   final List<String> searchHistoryList =
  //       SharedPreferencesHelper.getStringList(LocalStorageKeys.searchHistory);

  //   return searchHistoryList.reversed.toList();
  // }

  // @override
  // Future<void> setSearchHistory(String history) async {
  //   /// Get history search list from shared preferences.
  //   final List<String> searchHistoryList =
  //       SharedPreferencesHelper.getStringList(LocalStorageKeys.searchHistory);

  //   /// Check if history search word exists in list and list length higher than 5 remove this history word from list.
  //   if (searchHistoryList.length >= 5 && searchHistoryList.contains(history)) {
  //     searchHistoryList
  //         .remove(searchHistoryList.firstWhere((h) => h == history));
  //   }

  //   /// Check if history search word doesn't exists in list.
  //   if (!searchHistoryList.contains(history)) {
  //     /// Check if history search list length higher than 5 remove oldest item.
  //     if (searchHistoryList.length >= 5) {
  //       searchHistoryList.remove(searchHistoryList.first);
  //     }
  //     searchHistoryList.add(history);
  //     await SharedPreferencesHelper.setData(
  //         LocalStorageKeys.searchHistory, searchHistoryList);
  //   }
  // }

  // @override
  // Future<void> setSmsToken(String value) async {
  //   await SharedPreferencesHelper.setData(LocalStorageKeys.smsToken, value);
  // }

  // @override
  // String get smsToken {
  //   return SharedPreferencesHelper.getString(LocalStorageKeys.smsToken);
  // }
}
