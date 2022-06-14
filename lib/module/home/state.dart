import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_flutter/app/ui/keep_alive_page.dart';
import 'package:test_flutter/module/home/main/view.dart';
import 'package:test_flutter/module/home/navigate/view.dart';
import 'package:test_flutter/module/home/person/view.dart';
import 'package:test_flutter/module/home/system/view.dart';

class HomeState {
  late RxInt currentIndex;

  late List<BottomNavigationBarItem> navigateItems;

  late List<Widget> pageList;

  HomeState() {
    currentIndex = 0.obs;

    navigateItems = [
      const BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "首页"),
      const BottomNavigationBarItem(icon: Icon(Icons.assignment_rounded), label: "体系"),
      const BottomNavigationBarItem(icon: Icon(Icons.near_me_rounded), label: "导航"),
      const BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "我的")
    ];

    pageList = [const KeepAlivePage(MainPage()), const KeepAlivePage(SystemPage()), const KeepAlivePage(NavigatePage()), const KeepAlivePage(PersonPage())];
  }
}
