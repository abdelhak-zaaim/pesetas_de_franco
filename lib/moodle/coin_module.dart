import 'dart:convert';

import 'package:flutter/services.dart';

class CoinModel {
  String? name;
  String? value;
  String? year;

  String? foto_1;
  String? foto_2;
  String? tirada;

  String? peso;
  String? diametro;
  String? material;

  CoinModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    year = json['year'];

    foto_1 = "assets/images/"+json['foto_1']+"foto1.PNG";
    foto_2 = "assets/images/"+json['foto_2']+"foto2.PNG";
    tirada = json['tirada'];

    peso = json['peso'];
    diametro = json['diametro'];
    material = json['material'];
  }
}

