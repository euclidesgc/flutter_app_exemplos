import 'package:flutter/material.dart';

import '../hexa_color.dart';

Map<int, Color> primaryColorCodes = HexColor.getSwatch(HexColor("#FF1493"));
Map<int, Color> accentColorCodes = HexColor.getSwatch(HexColor("#5F04B4"));

MaterialColor primaryColorMaterial = MaterialColor(HexColor.getColorFromHex("#FF1493"), primaryColorCodes);
MaterialColor accentColorMaterial = MaterialColor(HexColor.getColorFromHex("#5F04B4"), accentColorCodes);
