import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'locale_store.g.dart';

@LazySingleton(as: LocaleStore)
class LocaleStoreImpl = LocaleStore with _$LocaleStoreImpl;

abstract class LocaleStore with Store {
  LocaleStore();

  @observable
  Locale currentLocale = const Locale('en');

  final locales = const [
    Locale('en', 'US'),
    Locale('hy', 'HY'),
  ];

  @action
  void switchLocale() {
    currentLocale = locales.where((element) => currentLocale != element).first;
  }
}
