import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universe/classes/planet.dart';

class MainProvider extends ChangeNotifier {
  List<Planet> planets = [];
  bool isLoading = false;

  void setLoading(bool state) {
    isLoading = state;
    notifyListeners();
  }

  Future<void> getPlanets() async {
    try {
      setLoading(true);
      final String response =
          await rootBundle.loadString("assets/files/planets.json");
      final List<dynamic> data = jsonDecode(response);
      planets = data.map((json) => Planet.fromJson(json)).toList();
      print(planets[0]);
    } catch (error) {
      print(error);
    } finally {
      setLoading(false);
    }
  }
}
